library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity onyarv_control_tb is
end entity onyarv_control_tb;

architecture sim of onyarv_control_tb is
    component onyarv_control
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
    end component;

    signal clk_i: std_logic := '0';
    signal rst_i: std_logic := '1';
    signal pc_o: unsigned(31 downto 0);
    signal instr_i: std_logic_vector(31 downto 0) := (others=>'0');
    signal instr_valid_i: std_logic := '0';
    signal instr_ready_o: std_logic;

-- Alu/shifter control lines
    signal shift_arith_o: std_logic; -- 1 shifter does arithmetic shift, else logical
    signal alu_sub_o: std_logic; -- 1 alu does sub instead of add
    signal shift_alu_op_o: std_logic_vector(2 downto 0); -- alu/shifter op (funct3)
    signal rimm_o: std_logic; -- 1 - second op is imm, 0 - second op is reg 
    -- Registers
    signal rd_o: unsigned(4 downto 0);
    signal rs1_o: unsigned(4 downto 0);
    signal rs2_o: unsigned(4 downto 0);
    -- I Immediate used in ALU
    signal i_imm_o: unsigned(31 downto 0);

    constant CLK_PERIOD: time := 10 ns;
begin
    clk_i <= not clk_i after CLK_PERIOD/2;

    comp: onyarv_control 
        port map(
            rst_i=>rst_i,
         clk_i=>clk_i,
         pc_o=>pc_o,
         instr_i=>instr_i,
         instr_valid_i=>instr_valid_i,
         instr_ready_o=>instr_ready_o,
         shift_arith_o=>shift_arith_o,
         alu_sub_o=>alu_sub_o,
         shift_alu_op_o=>shift_alu_op_o,
         rimm_o=>rimm_o,
         rd_o => rd_o,
         rs1_o => rs1_o,
         rs2_o => rs2_o,
         i_imm_o => i_imm_o
         );

    stimulus: process
    begin
        wait for 50 ns;
        rst_i <= '0';
        wait for 10 ns;
        wait until rising_edge(clk_i) and instr_ready_o='1';
        instr_valid_i <= '1';
        instr_i <= "000000000001" & "00000" & "000" & "00001" & "0010011"; -- ADDI R1=R0+1
        wait until rising_edge(clk_i);
        instr_valid_i <='0';
        wait;
        
    end process stimulus;
    
end architecture sim;