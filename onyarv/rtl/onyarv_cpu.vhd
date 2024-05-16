library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- tx valid
-- rx ready


-- top module, this module pretty much only conatins other module declarations

entity onyarv_cpu is
    port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        -- Instruction bus
        ins_adr_o: out std_logic_vector(31 downto 0);
        ins_dat_i: in std_logic_vector(31 downto 0);
        ins_stb_o: out std_logic;
        ins_ack_i: in std_logic;
        ins_cyc_o: out std_logic;
        -- Data bus
        data_addr_o: out std_logic_vector(31 downto 0);
        data_dat_i: in std_logic_vector(31 downto 0);
        data_dat_o: out std_logic_vector(31 downto 0);
        data_we_o: out std_logic;
        data_sel_o: out std_logic_vector(3 downto 0);
        data_stb_o: out std_logic;
        data_ack_i: in std_logic;
        data_cyc_o: out std_logic;
        -- debug signals
        stall_i: std_logic;
        irq_i: std_logic
         
    );
end entity onyarv_cpu;

architecture rtl of onyarv_cpu is
    component onyarv_fetch port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        -- Instruction bus
        ins_adr_o: out std_logic_vector(31 downto 0);
        ins_dat_i: in std_logic_vector(31 downto 0);
        ins_stb_o: out std_logic;
        ins_ack_i: in std_logic;
        ins_cyc_o: out std_logic;
        -- Output bus
        instr_o: out std_logic_vector(31 downto 0);
        instr_len_o: out std_logic; -- 1 when instr is 4 bytes, 2 otherwise
        instr_valid_o: out std_logic; 
        err_o: out std_logic;
        -- Address to load (PC)
        addr_i: in std_logic_vector(31 downto 0);
        load_i: in std_logic
    );
    end component;

    component onyarv_alu
    port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        arg1_i: in std_logic_vector(31 downto 0);
        arg2_i: in std_logic_vector(31 downto 0);
        shift_arith_i: in std_logic; -- 1 shift arith, 0 shift log
        alu_sub_i: in std_logic; -- 1 sub, 0 - add
        op_i: in std_logic_vector(2 downto 0);
        alu_en_i: in std_logic;
        res_o: out std_logic_vector(31 downto 0);
        res_valid_o: out std_logic
    );
    end component;

    component onyarv_reg
    port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        wen_i: in std_logic;
        src1_addr_i: in unsigned(4 downto 0);
        src2_addr_i: in unsigned(4 downto 0);
        dst_addr_i: in unsigned(4 downto 0);
        src1_data_o: out std_logic_vector(31 downto 0);
        src2_data_o: out std_logic_vector(31 downto 0);
        dst_data_i: in std_logic_vector(31 downto 0)
    );
    end component;

    signal instr: std_logic_vector(31 downto 0);
    signal instr_len: std_logic;
    signal instr_valid: std_logic;
    signal instr_err: std_logic;

    signal pc: unsigned(31 downto 0);
    signal do_instr_load: std_logic;

    signal shift_arith: std_logic;
    signal alu_sub: std_logic;
    signal funct3: std_logic_vector(2 downto 0);

    signal reg_imm: std_logic;

    signal rd: unsigned(4 downto 0);
    signal rs1: unsigned(4 downto 0);
    signal rs2: unsigned(4 downto 0);
    signal i_imm: std_logic_vector(31 downto 0);
    signal alu_imm: std_logic_vector(31 downto 0);

    signal alu_res_valid: std_logic;

    signal arg1: std_logic_vector(31 downto 0);
    signal arg2: std_logic_vector(31 downto 0);
    signal alu_result: std_logic_vector(31 downto 0);

    signal reg_wen: std_logic;
    signal src1_data: std_logic_vector(31 downto 0);
    signal src2_data: std_logic_vector(31 downto 0);

    signal alu_en: std_logic;

        -- Fetch-decode, execute, register writeback, memory access, trap
    type cpu_state_t is (FETCH, DECODE, EXECUTE, WB, TRAP);

    signal state: cpu_state_t;
    signal opcode: std_logic_vector(6 downto 0); -- Current instruction opcode
    signal s_imm: std_logic_vector(31 downto 0);
    signal b_imm: std_logic_vector(31 downto 0);
    signal u_imm: std_logic_vector(31 downto 0);
    signal j_imm: std_logic_vector(31 downto 0);
    signal instr_ready: std_logic;

    signal next_pc: unsigned(31 downto 0);

    signal first_fetch_cyc: std_logic;
    
    -- Sign extension
    signal imm_sign_ext: std_logic_vector(31 downto 11);
    -- Opcodes
    constant LOAD_INSTR: std_logic_vector(6 downto 0) :=    "0000011";
    constant STORE_INSTR: std_logic_vector(6 downto 0) :=   "0100011";
    constant LUI_INSTR: std_logic_vector(6 downto 0) :=     "0110111"; 
    constant AUIPC_INSTR: std_logic_vector(6 downto 0) :=   "0010111";
    constant JAL_INSTR: std_logic_vector(6 downto 0) :=     "1101111";
    constant JALR_INSTR: std_logic_vector(6 downto 0) :=    "1100111";
    constant BRANCH_INSTR: std_logic_vector(6 downto 0) :=  "1100011";
    constant OPIMM_INSTR: std_logic_vector(6 downto 0) :=   "0010011";
    constant OP_INSTR: std_logic_vector(6 downto 0) :=      "0110011";
    constant FENCE_INSTR: std_logic_vector(6 downto 0) :=   "0001111";
    constant SYSTEM_INSTR: std_logic_vector(6 downto 0) :=   "1110011";

begin

    fetch_inst: onyarv_fetch
    port map (
      rst_i         => rst_i,
      clk_i         => clk_i,
      ins_adr_o     => ins_adr_o,
      ins_dat_i     => ins_dat_i,
      ins_stb_o     => ins_stb_o,
      ins_ack_i     => ins_ack_i,
      ins_cyc_o     => ins_cyc_o,
      instr_o       => instr,
      instr_len_o   => instr_len,
      instr_valid_o => instr_valid,
      err_o         => instr_err,
      addr_i        => std_logic_vector(pc),
      load_i        => do_instr_load
    );

    alu_inst: onyarv_alu port map (
        rst_i => rst_i,
        clk_i => clk_i,
        arg1_i => arg1,
        arg2_i => arg2,
        shift_arith_i => shift_arith,
        alu_sub_i => alu_sub,
        op_i => funct3,
        alu_en_i => alu_en,
        res_o => alu_result,
        res_valid_o => alu_res_valid
    );

    reg_inst: onyarv_reg
    port map (
        rst_i => rst_i,
        clk_i => clk_i,
        wen_i => reg_wen,
        src1_addr_i => rs1,
        src2_addr_i => rs2,
        dst_addr_i => rd,
        src1_data_o => src1_data,
        src2_data_o => src2_data,
        dst_data_i => alu_result
    );

    --Instruction load process, load instruction to instr if we are in FD state and predecode them
    instr_load: process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            state <= FETCH;
            instr_ready <= '1';
            pc <= (others=>'0');
            reg_wen <= '0';
            first_fetch_cyc <= '1';
            alu_en <= '0';
            do_instr_load <= '1';
        elsif rising_edge(clk_i) then
            if state=FETCH then
                first_fetch_cyc <= '0';
            end if;

            if state=FETCH and instr_valid = '1' and  instr_ready = '1' and first_fetch_cyc /= '1' then
                instr_ready <= '0';
                do_instr_load <= '0';
                
                -- Decode immediates
                i_imm <= imm_sign_ext & instr(30 downto 20);
                s_imm <= imm_sign_ext & instr(30 downto 25) & instr(11 downto 7);
                b_imm <= imm_sign_ext(31 downto 12) & instr(7) & instr(30 downto 25) & instr(11 downto 8) & '0';
                u_imm <= imm_sign_ext(31) & instr(30 downto 12) & "000000000000";
                j_imm <= imm_sign_ext(31 downto 20) & instr(19 downto 12) & instr(20) & instr(30 downto 21) & '0';

                -- Decode registers
                rd <= unsigned(instr(11 downto 7));
                rs1 <= unsigned(instr(19 downto 15));
                rs2 <= unsigned(instr(24 downto 20));

                --store instr in reg for other phases
                --instr <= instr_i;
                state <= DECODE;
            elsif state=DECODE then
                if opcode = JAL_INSTR or opcode = JALR_INSTR then
                    -- dummy signals for alu
                    alu_sub <= '0';
                    funct3 <= "000";
                    reg_imm <= '1';
                elsif opcode = LUI_INSTR then
                    alu_imm <= u_imm;
                    alu_sub <= '0';
                    funct3 <= "000"; -- Add ?
                    alu_en <= '1';
                elsif opcode = OPIMM_INSTR then
                    shift_arith <= instr(30);
                    alu_sub <= '0';--instr(30);
                    funct3 <= instr(14 downto 12);
                    reg_imm <= '1';
                    alu_imm <= i_imm;
                    alu_en <= '1';
                elsif opcode = OP_INSTR then
                    shift_arith <= instr(30);
                    alu_sub <= instr(30);
                    funct3 <= instr(14 downto 12);
                    reg_imm <= '0';
                    alu_en <= '1';
                elsif opcode = BRANCH_INSTR then
                    if instr(14 downto 13) = "00" then -- eq/ne
                        shift_arith <= instr(30);
                        alu_sub <= '1';
                        funct3 <= "000";
                        reg_imm <= '0';
                        alu_en <= '1';
                    elsif instr(14 downto 13) = "10" then -- lt, ge
                        shift_arith <= instr(30);
                        alu_sub <= '0';
                        funct3 <= "010"; --slt
                        reg_imm <= '0';
                        alu_en <= '1';
                    else -- ltu/geu
                        shift_arith <= instr(30);
                        alu_sub <= '0';
                        funct3 <= "011"; --slt
                        reg_imm <= '0';
                        alu_en <= '1';
                    end if;
                end if;

                state<= EXECUTE;
            elsif state=EXECUTE then

                alu_en <= '0';
                
                if (instr_len = '1') then
                    next_pc <= pc+4;
                else
                    next_pc <= pc+2;
                end if;

                if opcode = JAL_INSTR then
                    next_pc <= pc + unsigned(j_imm); -- maybe signed?
                end if; 

                if opcode = JALR_INSTR then
                    next_pc <= pc + unsigned(i_imm) + unsigned(src1_data);  -- maybe signed? also need to remove last bit
                end if; 

                if opcode = BRANCH_INSTR then
                    if instr(14 downto 13) = "00" then -- eq/ne
                        if (instr(12) = '0' and alu_result = x"00000000") or (instr(12) = '1' and alu_result /= x"00000000") then
                            next_pc <= pc + unsigned(b_imm);        
                        end if;
                    elsif instr(14 downto 13) = "10" then -- lt, ge
                        if (instr(12) = '0' and alu_result = x"00000001") or (instr(12) = '1' and alu_result /= x"00000001") then
                            next_pc <= pc + unsigned(b_imm);        
                        end if;
                    else -- ltu/geu
                        if (instr(12) = '0' and alu_result = x"00000001") or (instr(12) = '1' and alu_result /= x"00000001") then
                            next_pc <= pc + unsigned(b_imm);        
                        end if;
                    end if;

                end if;

                
                if alu_res_valid = '1' and (opcode = OPIMM_INSTR or opcode = OP_INSTR or opcode = LUI_INSTR) then
                    state <= WB;
                    reg_wen <= '1';
                elsif (opcode /= OPIMM_INSTR and opcode /= OP_INSTR and opcode /= LUI_INSTR) then
                    state <= WB;
                end if;
            elsif state=WB then 
                state <= FETCH;
                reg_wen <= '0';
                instr_ready <= '1';
                pc <= next_pc;
                
                first_fetch_cyc <= '1';
                do_instr_load <= '1';
            elsif state=TRAP then
            end if;

            
        end if;
    end process instr_load; 

    arg1 <= src1_data;
    arg2 <= src2_data when reg_imm = '0' else alu_imm;

    imm_sign_ext <= (others=>instr(31));

    -- Load opcode
    opcode <= instr(6 downto 0);
    
end architecture rtl;