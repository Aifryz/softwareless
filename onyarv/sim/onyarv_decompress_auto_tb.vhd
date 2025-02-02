library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

entity onyarv_decompress_auto_tb is
end entity onyarv_decompress_auto_tb;

architecture sim of onyarv_decompress_auto_tb is
    component onyarv_decompress
        port (
            inst_i: in std_logic_vector(15 downto 0);
            inst_o: out std_logic_vector(31 downto 0)
        );
        end component;
        signal inst_i: std_logic_vector(15 downto 0) := (others=>'0');
        signal inst_o: std_logic_vector(31 downto 0);

file inputs : text;
--file inputs : text;

begin
    
    UUT: onyarv_decompress port map(
        inst_i => inst_i,
        inst_o => inst_o
    );

 

  proc_name: process
    variable in_line : line;
    variable read_ok : boolean;
    variable chr: character;
    variable in_val: bit_vector(15 downto 0);
  begin
    file_open(inputs, "input_vectors.txt",  read_mode);
    while not endfile(inputs) loop
      readline(inputs, in_line);
      if(in_line'length /= 0) then
        if in_line.all(1) = '#' then
          writeline(output, in_line);
        else 
          read(in_line, in_val);
          inst_i <= to_stdlogicvector(in_val);
          wait for 1 us;
        end if;
      end if; 
    end loop;

    wait;
  end process proc_name;


    
end architecture sim;