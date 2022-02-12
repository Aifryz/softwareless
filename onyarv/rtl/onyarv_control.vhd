library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity onyarv_control is
    port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        pc_o: out unsigned(31 downto 0);
        instr_i: in std_logic_vector(31 downto 0);
        instr_valid_i: in std_logic;
        instr_ready_o: out std_logic;
        -- Alu/shifter control lines
        shift_arith_o: out std_logic; -- 1 shifter does arithmetic shift, else logical
        alu_sub_o: out std_logic; -- 1 alu does sub instead of add
        shift_alu_op_o: out std_logic_vector(2 downto 0); -- alu/shifter op (funct3)
        rimm_o: out std_logic; -- 1 - second op is imm, 0 - second op is reg 
        -- Registers
        rd_o: out unsigned(4 downto 0);
        rs1_o: out unsigned(4 downto 0);
        rs2_o: out unsigned(4 downto 0);
        -- I Immediate used in ALU
        i_imm_o: out unsigned(31 downto 0)
    );
end entity onyarv_control;


architecture rtl of onyarv_control is
    -- Fetch-decode, execute, register writeback, memory access, trap
    type cpu_state_t is (FETCH, DECODE, EXECUTE, WB, TRAP);

    signal instr: std_logic_vector(31 downto 0); -- Current fetched instruction
    signal state: cpu_state_t;
    signal opcode: std_logic_vector(6 downto 0); -- Current instruction opcode
    signal i_imm: std_logic_vector(31 downto 0);
    signal s_imm: std_logic_vector(31 downto 0);
    signal b_imm: std_logic_vector(31 downto 0);
    signal u_imm: std_logic_vector(31 downto 0);
    signal j_imm: std_logic_vector(31 downto 0);
    signal rd : std_logic_vector(4 downto 0);
    signal rs1 : std_logic_vector(4 downto 0);
    signal rs2 : std_logic_vector(4 downto 0);
    signal pc: unsigned(31 downto 0);
    signal instr_ready: std_logic;
    
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
    --Instruction load process, load instruction to instr if we are in FD state and predecode them
    instr_load: process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            state <= FETCH;
            instr_ready <= '1';
            pc <= (others=>'0');
        elsif rising_edge(clk_i) then
            if state=FETCH and instr_valid_i = '1' and  instr_ready = '1' then
                instr_ready <= '0';
                
                -- Decode immediates
                i_imm <= imm_sign_ext & instr_i(30 downto 20);
                s_imm <= imm_sign_ext & instr_i(30 downto 25) & instr_i(11 downto 7);
                b_imm <= imm_sign_ext(31 downto 12) & instr_i(7) & instr_i(30 downto 25) & instr_i(11 downto 8) & '0';
                u_imm <= imm_sign_ext(31) & instr_i(30 downto 12) & "000000000000";
                j_imm <= imm_sign_ext(31 downto 20) & instr_i(19 downto 12) & instr_i(20) & instr_i(30 downto 21) & '0';

                -- Decode registers
                rd <= instr_i(11 downto 7);
                rs1 <= instr_i(19 downto 15);
                rs2 <= instr_i(24 downto 20);

                --store instr in reg for other phases
                instr <= instr_i;

                state <= DECODE;
            elsif state=DECODE then
                -- 
            end if;
        end if;
    end process instr_load; 

    --Decode ALU control signals


    instr <= instr_i;
    imm_sign_ext <= (others=>instr_i(31));
    instr_ready_o <= instr_ready;
    pc_o <= pc;

    -- Selected registers
    rd_o <= unsigned(rd);
    rs1_o <= unsigned(rs1);
    rs2_o <= unsigned(rs2);
    -- I Immediate used in alu
    i_imm_o <= unsigned(i_imm);

    -- Load opcode
    opcode <= instr(6 downto 0);


    
end architecture rtl;