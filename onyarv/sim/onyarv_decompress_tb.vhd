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
      -- quadrant 0
      inst_i <= std_logic_vector(to_unsigned(16#0000#, 16));
      wait for 10 ns;
      inst_i <= "000"&"11110000"&"000"&"00"; -- c.addi4spn
      wait for 10 ns;
      inst_i <= "000"&"00001111"&"000"&"00";-- c.addi4spn
      wait for 10 ns;
      inst_i <= "010" & "100" & "111"&"01"&"101"&"00";-- c.lw
      wait for 10 ns;
      inst_i <= "110" & "100" & "111"&"01"&"101"&"00";-- c.sw
      wait for 10 ns;
      -- quadrant 1
      inst_i <= "000" & "0" & "00000"&"00000"&"01"; -- c.nop
      wait for 10 ns;
      inst_i <= "000" & "1" & "00100"&"01000"&"01"; -- c.addi
      wait for 10 ns;
      inst_i <= "001" & "10000011111" & "01"; --c.jal
      wait for 10 ns;
      inst_i <= "010" & "1" & "00100"&"01000"&"01"; -- c.li
      wait for 10 ns;
      inst_i <= "011" & "1" & "00010"&"01000"&"01"; -- c.addi16sp
      wait for 10 ns;
      inst_i <= "011" & "1" & "00100"&"01000"&"01"; -- c.lui

      wait for 10 ns;
      inst_i <= "100" & "1" & "00" & "010" &"00000" & "01"; -- c.srli
      wait for 10 ns;
      inst_i <= "100" & "1" & "01" & "010" &"00000" & "01"; -- c.srai
      wait for 10 ns;
      inst_i <= "100" & "1" & "10" & "010" &"00000" & "01"; -- c.andi

      wait for 10 ns;
      inst_i <= "100" & "0" & "11" & "010" & "00" & "100" & "01"; -- c.sub
      wait for 10 ns;
      inst_i <= "100" & "0" & "11" & "010" & "01" & "100" & "01"; -- c.xor
      wait for 10 ns;
      inst_i <= "100" & "0" & "11" & "010" & "10" & "100" & "01"; -- c.or
      wait for 10 ns;
      inst_i <= "100" & "0" & "11" & "010" & "11" & "100" & "01"; -- c.and

      wait for 10 ns;
      inst_i <= "101" & "10000011111" & "01"; --c.jal

      wait for 10 ns;
      inst_i <= "110" & "110" & "000" & "00111" & "01"; -- c.beqz
      wait for 10 ns;
      inst_i <= "111" & "110" & "000" & "00111" & "01"; -- c.bnez

       -- quadrant 2

      wait for 10 ns;
      inst_i <= "000" & "0" & "00100" & "10000" & "10"; -- c.slli
      wait for 10 ns;
      inst_i <= "010" & "0" & "00100" & "10000" & "10"; --c.lwsp
      wait for 10 ns;
      inst_i <= "100" & "0" & "00100" & "00000" & "10"; --c.jr
      wait for 10 ns;
      inst_i <= "100" & "0" & "00100" & "10000" & "10"; --c.mv

      wait for 10 ns;
      inst_i <= "100" & "1" & "00000" & "00000" & "10"; --c.ebreak
      wait for 10 ns;
      inst_i <= "100" & "1" & "00100" & "00000" & "10"; --c.jalr
      wait for 10 ns;
      inst_i <= "100" & "1" & "00100" & "10000" & "10"; --c.add
      wait for 10 ns;
      inst_i <= "110" &"000111"&"01001"& "10"; --c.swsp
      wait;
  end process proc_name;


    
end architecture sim;