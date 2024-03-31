library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity onyarv_reg is
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
end entity onyarv_reg;


architecture rtl of onyarv_reg is
    type reg_file_type is array (31 downto 0) of std_logic_vector(31 downto 0);
    signal reg_file: reg_file_type;
begin
    beh: process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_i = '1' then
                -- Regs are not reset           
            else
                if wen_i = '1' then
                    reg_file(to_integer(dst_addr_i)) <= dst_data_i;
                end if;
                if src1_addr_i /= 0 then
                    src1_data_o <= reg_file(to_integer(src1_addr_i));
                else
                    src1_data_o <= (others=>'0');
                end if;

                if src2_addr_i /= 0 then
                    src2_data_o <= reg_file(to_integer(src2_addr_i));
                else
                    src2_data_o <= (others=>'0');
                end if;
            end if;
        end if;
    end process beh;
    
    
end architecture rtl;
