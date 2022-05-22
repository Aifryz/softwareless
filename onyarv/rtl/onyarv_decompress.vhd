library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- RISC-V decompression

entity onyarv_decompress is
    port (
        inst_i: in std_logic_vector(15 downto 0);
        inst_o: out std_logic_vector(31 downto 0)
    );
end entity onyarv_decompress;

architecture rtl of onyarv_decompress is
    alias func3: std_logic_vector(2 downto 0) is inst_i(15 downto 13);
    alias quad: std_logic_vector(1 downto 0) is inst_i(1 downto 0);
    alias rs1dp: std_logic_vector(2 downto 0) is inst_i(9 downto 7);
    alias rs2p: std_logic_vector(2 downto 0) is inst_i(4 downto 2);
    alias rs1d: std_logic_vector(4 downto 0) is inst_i(11 downto 7);
    alias rs2: std_logic_vector(4 downto 0) is inst_i(6 downto 2);

    --decoded full register addresses
    signal rs1dp_dec: std_logic_vector(4 downto 0);
    signal rs2p_dec: std_logic_vector(4 downto 0);

begin

    --decode compressed regs
    rs1dp_dec <= "01" & rs1dp;
    rs2p_dec <= "01" & rs2p;
    

   decompress: process(inst_i)
    function decodeimmx( instr: std_logic_vector) return std_logic_vector is
        begin
            return "0000";
        end decodeimmx;
   begin
    inst_o <= (others=>'0');

    if quad = "00" then
        if func3 = "000" then
            -- c.addi4spn
            -- expands to addi rd', x2, nzuimm[9:2]
            

        elsif func3 = "100" then
            --reserved
        elsif func3 = "110" then
            -- c.sw
            -- expands to sw rs2 ′, offset[6:2](rs1 ′)
            --inst_o <= ""
        end if;
    elsif quad = "01" then
        if func3 = "000" then
            --nop/addi, depending on rd/rs
            if rs1dp = "000" then -- nop

            else -- add or hints

            end if;
        elsif func3 = "001" then
            --jal 
        elsif func3 = "010" then
            --li
        elsif func3 = "011" then
            --addi16sp/lui
        elsif func3 = "100" then
            --ops
        elsif func3 = "101" then
            --jump
        elsif func3 = "110" then
            --beqz
        elsif func3 = "111" then
            --bnez
        else
        end if;
    elsif quad = "10" then
        if func3 = "000" then
            --slli
        elsif func3 = "001" then
            --
        elsif func3 = "010" then
            -- lwsp
        elsif func3 = "011" then
            --res?
        elsif func3 = "100" then
            --various
        elsif func3 = "101" then
            --res?
        elsif func3 = "110" then
            --swsp
        elsif func3 = "111" then
            -- res?
        else
        end if;
    else
        --not necessarily invalid, just not compressed
    end if;


       
   end process decompress;


    
    
    
end architecture rtl;