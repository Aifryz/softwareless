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
    component onyarv_control
    port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        pc_o: out unsigned(31 downto 0);
        instr_i: in std_logic_vector(31 downto 0);
        instr_valid_i: in std_logic;
        instr_len_i: in std_logic;
        instr_ready_o: out std_logic;
        -- Alu/shifter control lines
        shift_arith_o: out std_logic; -- 1 shifter does arithmetic shift, else logical
        alu_sub_o: out std_logic; -- 1 alu does sub instead of add
        shift_alu_op_o: out std_logic_vector(2 downto 0); -- alu/shifter op (funct3)
        alu_en_o: out std_logic;
        rimm_o: out std_logic; -- 1 - second op is imm, 0 - second op is reg 
        res_valid_i: in std_logic;
        -- Registers
        rd_o: out unsigned(4 downto 0);
        rs1_o: out unsigned(4 downto 0);
        rs2_o: out unsigned(4 downto 0);
        red_wen_o: out std_logic;
        -- I Immediate used in ALU
        i_imm_o: out unsigned(31 downto 0);
        alu_res_i: in std_logic_vector(31 downto 0)
    );
    end component;

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

    signal pc: std_logic_vector(31 downto 0);
    signal instr_load: std_logic;

    signal shift_arith: std_logic;
    signal alu_sub: std_logic;
    signal funct3: std_logic_vector(2 downto 0);

    signal reg_imm: std_logic;

    signal rd: unsigned(4 downto 0);
    signal rs1: unsigned(4 downto 0);
    signal rs2: unsigned(4 downto 0);
    signal i_imm: unsigned(31 downto 0);

    signal alu_res_valid: std_logic;

    signal arg1: std_logic_vector(31 downto 0);
    signal arg2: std_logic_vector(31 downto 0);
    signal alu_result: std_logic_vector(31 downto 0);

    signal reg_wen: std_logic;
    signal src1_data: std_logic_vector(31 downto 0);
    signal src2_data: std_logic_vector(31 downto 0);

    signal alu_en: std_logic;

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
      addr_i        => pc,
      load_i        => instr_load
    );
    
    control_inst : onyarv_control
    port map (
      rst_i          => rst_i,
      clk_i          => clk_i,
      std_logic_vector(pc_o)           => pc,
      instr_i        => instr,
      instr_valid_i  => instr_valid,
      instr_len_i => instr_len,
      instr_ready_o  => instr_load,
      shift_arith_o  => shift_arith,
      alu_sub_o      => alu_sub,
      shift_alu_op_o => funct3,
      alu_en_o       => alu_en,
      res_valid_i => alu_res_valid,
      rimm_o         => reg_imm,
      rd_o           => rd,
      rs1_o          => rs1,
      rs2_o          => rs2,
      red_wen_o      => reg_wen,
      i_imm_o        => i_imm,
      alu_res_i      => alu_result
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

    arg1 <= src1_data;
    arg2 <= src2_data when reg_imm = '0' else std_logic_vector(i_imm);
    
    
end architecture rtl;