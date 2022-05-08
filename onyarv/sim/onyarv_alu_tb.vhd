library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity onyarv_alu_tb is
end entity onyarv_alu_tb;


architecture rtl of onyarv_alu_tb is
    constant CLK_PERIOD: time := 10 ns;
    component onyarv_alu port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        arg1_i: in std_logic_vector(31 downto 0);
        arg2_i: in std_logic_vector(31 downto 0);
        shift_arith_i: in std_logic; -- 1 shift arith, 0 shift log
        alu_sub_i: in std_logic; -- 1 sub, 0 - add
        op_i: in std_logic_vector(2 downto 0);
        res_o: out std_logic_vector(31 downto 0);
        res_valid_o: out std_logic
    );
    end component;


    signal rst_i: std_logic := '1';
    signal clk_i: std_logic := '0';
    signal arg1_i: std_logic_vector(31 downto 0);
    signal arg2_i: std_logic_vector(31 downto 0);
    signal shift_arith_i: std_logic; -- 1 shift arith, 0 shift log
    signal alu_sub_i: std_logic; -- 1 sub, 0 - add
    signal op_i: std_logic_vector(2 downto 0);
    signal res_o: std_logic_vector(31 downto 0);
    signal res_valid_o: std_logic;
begin
    clk_i <= not clk_i after CLK_PERIOD/2;

    UUT: onyarv_alu port map(
        rst_i => rst_i,
        clk_i => clk_i,
        arg1_i => arg1_i,
        arg2_i=> arg2_i,
        shift_arith_i => shift_arith_i,
        alu_sub_i => alu_sub_i,
        op_i => op_i,
        res_o => res_o,
        res_valid_o => res_valid_o
    );

    

    proc_name: process
    begin
        shift_arith_i <= '0';
        wait for 50 ns;
        rst_i <= '0';
        op_i <= "000";  --add/sub
        arg1_i <= std_logic_vector(to_signed(12, arg1_i'length));
        arg2_i <= std_logic_vector(to_signed(6, arg1_i'length));
        wait for 10 ns;
        wait until falling_edge(clk_i);
        op_i <= "000";  --add/sub
        --Regular add
        arg1_i <= std_logic_vector(to_signed(6, arg1_i'length));
        arg2_i <= std_logic_vector(to_signed(2, arg1_i'length));
        wait until falling_edge(clk_i);
        --Add pos to neg
        arg1_i <= std_logic_vector(to_signed(6, arg1_i'length));
        arg2_i <= std_logic_vector(to_signed(-2, arg1_i'length));
        wait until falling_edge(clk_i);
        -- sub 
        alu_sub_i <= '1';
        arg1_i <= std_logic_vector(to_signed(2, arg1_i'length));
        arg2_i <= std_logic_vector(to_signed(6, arg1_i'length));
        wait until falling_edge(clk_i);
        alu_sub_i <= '0';
        --binops
        op_i <= "110"; --or
        
        arg1_i <= std_logic_vector(to_unsigned(16#00AAFF55#, arg1_i'length));
        arg2_i <= std_logic_vector(to_unsigned(16#0F5500AA#, arg2_i'length));
        wait until falling_edge(clk_i);
        op_i <= "100"; --xor
        arg1_i <= std_logic_vector(to_unsigned(16#00AAFF55#, arg1_i'length));
        arg2_i <= std_logic_vector(to_unsigned(16#0F5500FF#, arg2_i'length));
        wait until falling_edge(clk_i);
        op_i <= "111"; --and
        arg1_i <= std_logic_vector(to_unsigned(16#00AAFF55#, arg1_i'length));
        arg2_i <= std_logic_vector(to_unsigned(16#0F5500FF#, arg2_i'length));
        wait until falling_edge(clk_i);

        --shifts
        op_i <= "001"; --shift left
        arg1_i <= std_logic_vector(to_unsigned(16#00000001#, arg1_i'length));
        arg2_i <= std_logic_vector(to_unsigned(16#00000000#, arg1_i'length));
        wait until falling_edge(clk_i);

        arg1_i <= std_logic_vector(to_unsigned(16#00000001#, arg1_i'length));
        arg2_i <= std_logic_vector(to_unsigned(16#00000001#, arg1_i'length));
        wait until falling_edge(clk_i);

        arg1_i <= std_logic_vector(to_unsigned(16#00000001#, arg1_i'length));
        arg2_i <= std_logic_vector(to_unsigned(16#00000004#, arg1_i'length));
        wait until rising_edge(res_valid_o);
        wait until falling_edge(clk_i);

        op_i <= "101"; --shift righ, logical
        shift_arith_i <= '0';

        arg1_i <= (31=>'1', others=>'0');
        arg2_i <= std_logic_vector(to_unsigned(16#00000000#, arg1_i'length));
        wait until falling_edge(clk_i);

        arg1_i <= (31=>'1', others=>'0');
        arg2_i <= std_logic_vector(to_unsigned(16#00000001#, arg1_i'length));
        wait until falling_edge(clk_i);

        arg1_i <= (31=>'1', others=>'0');
        arg2_i <= std_logic_vector(to_unsigned(16#00000004#, arg1_i'length));
        wait until rising_edge(res_valid_o);
        wait until falling_edge(clk_i);

        op_i <= "101"; --shift right 
        shift_arith_i <= '1';

        arg1_i <= (31=>'1', others=>'0');
        arg2_i <= std_logic_vector(to_unsigned(16#00000000#, arg1_i'length));
        wait until falling_edge(clk_i);

        arg1_i <= (31=>'1', others=>'0');
        arg2_i <= std_logic_vector(to_unsigned(16#00000001#, arg1_i'length));
        wait until falling_edge(clk_i);

        arg1_i <= (31=>'1', others=>'0');
        arg2_i <= std_logic_vector(to_unsigned(16#00000004#, arg1_i'length));
        wait until rising_edge(res_valid_o);
        wait until falling_edge(clk_i);




        wait;
    end process proc_name;
    
    
end architecture rtl;