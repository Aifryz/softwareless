library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity onyarv_cpu_tb is
end entity onyarv_cpu_tb;


architecture tb of onyarv_cpu_tb is
    signal clk_i: std_logic := '0';
    signal rst_i: std_logic := '1';
    signal i_addr_o: std_logic_vector(31 downto 0);
    signal i_data_i: std_logic_vector(31 downto 0) := (others => '0');
    constant CLK_PERIOD: time := 10 ns;
begin
    clk_i <= not clk_i after CLK_PERIOD/2;

    stimulus: process
    begin
        wait for 50 ns;
        rst_i <= '0';
        wait for 10 ns;
        assert 0=1 report "Simulation end" severity note;

        wait;
        
    end process stimulus;
    
    
    
end architecture tb;