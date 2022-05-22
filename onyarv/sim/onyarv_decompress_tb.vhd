library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity onyarv_decompress_tb is
end entity onyarv_decompress_tb;

architecture sim of onyarv_decompress_tb is
    component onyarv_decompress
        port (
            inst_i: in std_logic_vector(15 downto 0);
            inst_o: out std_logic_vector(31 downto 0)
        );
        end component;
        signal inst_i: std_logic_vector(15 downto 0) := (others=>'0');
        signal inst_o: std_logic_vector(31 downto 0);
    
begin
    
    UUT: onyarv_decompress port map(
        inst_i => inst_i,
        inst_o => inst_o
    );

  proc_name: process
  begin
      inst_i <= std_logic_vector(to_unsigned(16#0000#, 16));
      wait for 50 ns;
      inst_i <= "000"&"11110000"&"000"&"00";
      wait for 50 ns;
      inst_i <= "000"&"00001111"&"000"&"00";
      wait for 50 ns;
      wait;
  end process proc_name;


    
end architecture sim;