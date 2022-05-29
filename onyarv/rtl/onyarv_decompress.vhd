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
    signal rdp_dec: std_logic_vector(4 downto 0);

begin

    --decode compressed regs
    rs1dp_dec <= "01" & rs1dp;
    rs2p_dec <= "01" & rs2p;
    rdp_dec <= "01" & rs2p;
    

   decompress: process(inst_i)
    variable imm12: std_logic_vector(11 downto 0);
    variable imm12_ext6 : std_logic_vector(5 downto 0);
    variable imm20: std_logic_vector(19 downto 0);
    variable imm20_ext9: std_logic_vector(8 downto 0);
    variable imm20_ext13: std_logic_vector(12 downto 0);
    variable imm6: std_logic_vector(5 downto 0);

   begin
    inst_o <= (others=>'0');

    if quad = "00" then
        if func3 = "000" then
            -- c.addi4spn
            -- expands to addi rd', x2, nzuimm[9:2]
            imm12 := "00"&inst_i(10 downto 7) & inst_i(12 downto 11) & inst_i(5) & inst_i(6)&"00";
            inst_o <= imm12&"00010"&"000"&rs1dp_dec&"0010011";
        elsif func3 = "010" then
            -- c.lw, expands to lw rd ′, offset[6:2](rs1 ′)
            imm12 := "00000"&inst_i(5)&inst_i(12 downto 10)&inst_i(6)&"00";
            inst_o <= imm12&rs1dp_dec&"010"&rdp_dec&"0000011";
        elsif func3 = "100" then
            --reserved
        elsif func3 = "110" then
            -- c.sw
            -- expands to sw rs2 ′, offset[6:2](rs1 ′)
            imm12 := "00000"&inst_i(5)&inst_i(12 downto 10)&inst_i(6)&"00";
            inst_o <= imm12(11 downto 5)&rs2p_dec&rs1dp_dec&"010"&imm12(4 downto 0)&"0100011";
        end if;
    elsif quad = "01" then
        if func3 = "000" then
            --nop/addi, depending on rd/rs
            --ex. addi rd, rd, nzimm[5:0]
            -- we are going to ignore all hints here
            imm12_ext6 := (others=>inst_i(12));
            imm12 := imm12_ext6&inst_i(12) & inst_i(6 downto 2);
            inst_o <= imm12&rs1dp_dec&"000"&rs1dp_dec&"0110011";

        elsif func3 = "001" then
            --jal 
            --expands to jal x1, offset[11:1]
            imm20_ext9 := (others=>inst_i(12));
            imm20 := imm20_ext9 & (inst_i(12)) & inst_i(8) & inst_i(10 downto 9) & inst_i(6) & inst_i(7) & inst_i(2) & inst_i(11) & inst_i(5 downto 3);
            inst_o <= imm20(19) & imm20(9 downto 0) & imm20(10) & imm20(18 downto 11) & "00001"&"1101111";

        elsif func3 = "010" then
            --c.li
            -- expands to addi rd, x0, imm[5:0]
            imm12 := "00000"&inst_i(5)&inst_i(12 downto 10)&inst_i(6)&"00";
            inst_o <= imm12&"00000"&"000"&rs1dp_dec&"0110011";

        elsif func3 = "011" then
            --addi16sp/lui
            -- c.lui lui rd, nzimm[17:12]
            --addi16sp -> addi x2, x2, nzimm[9:4].
            if rs1d = "00010" then
                --addi16sp
                imm12 := (11|10|9 => inst_i(12))&inst_i(12)&inst_i(4 downto 3)&inst_i(5)&inst_i(2)&inst_i(6)&"0000";
                inst_o <= imm12&"00010"&"000"&"00010"&"0110011";
            elsif rs1d = "00000" then
                -- reserved
            else
                -- lui
                imm20_ext13 := (others=>inst_i(12));
                imm20 := (imm20_ext13 & inst_i(12) & inst_i(6 downto 2));
                inst_o <= imm20 & rs1d&"0110111";
            end if;

        elsif func3 = "100" then
            --ops
            imm12_ext6 := (others=>inst_i(12));
            
            if inst_i(11 downto 10) = "00" then
                --c.srli expands to srli rd′,rd′, shamt[5:0],
                imm6 := inst_i(12) & inst_i(6 downto 2);
                inst_o <= "0000000"&imm6&rs1dp_dec&"101"&rs1dp_dec&"0010011";
            elsif inst_i(11 downto 10) = "01" then
                --c.srai expands to srai rd′, rd′, shamt[5:0]
                imm6 := inst_i(12) & inst_i(6 downto 2);
                inst_o <= "0100000"&imm6&rs1dp_dec&"101"&rs1dp_dec&"0010011";
            elsif inst_i(11 downto 10) = "10" then
                --c.andi expands to andi rd′, rd′, imm[5:0]
                imm12 := imm12_ext6&inst_i(12) & inst_i(6 downto 2);
                inst_o <= imm12 & rs1dp_dec & "111" & rs1dp_dec & "0010011";
            elsif inst_i(11 downto 10) = "11" then
                if inst_i(6 downto 5) = "00" then
                    --c.sub expands into sub rd′, rd′, rs2 ′
                    inst_o <= "0100000"&rs2p_dec&rs1dp_dec&"000"&rs1dp_dec&"0110011";
                elsif inst_i(6 downto 5) = "01" then
                    --c.xor expands to xor rd ′, rd ′, rs2 ′
                    inst_o <= "0100000"&rs2p_dec&rs1dp_dec&"100"&rs1dp_dec&"0110011";
                elsif inst_i(6 downto 5) = "10" then
                    --c.or expands to or rd ′, rd ′, rs2 ′
                    inst_o <= "0100000"&rs2p_dec&rs1dp_dec&"110"&rs1dp_dec&"0110011";
                elsif inst_i(6 downto 5) = "11" then
                    --c.and expands to and rd ′, rd ′, rs2 ′
                    inst_o <= "0100000"&rs2p_dec&rs1dp_dec&"111"&rs1dp_dec&"0110011";
                end if;
            end if;
        elsif func3 = "101" then
            --jump
            --c.j expands to jal x0, offset[11:1]
            imm20_ext9 := (others=>inst_i(12));
            imm20 := imm20_ext9 & (inst_i(12)) & inst_i(8) & inst_i(10 downto 9) & inst_i(6) & inst_i(7) & inst_i(2) & inst_i(11) & inst_i(5 downto 3);
            inst_o <= imm20(19) & imm20(9 downto 0) & imm20(10) & imm20(18 downto 11) & "00000"&"1101111";
        elsif func3 = "110" then
            --beqz
            --expands to beq rs1′, x0, offset[8:1]
            imm12_ext6 := (others=>inst_i(12));
            imm12 := imm12_ext6(4 downto 0) & inst_i(6 downto 5) & inst_i(2)&inst_i(11 downto 10)&inst_i(4 downto 3);
            inst_o <= imm12(11) & imm12(9 downto 4) & "00000" & rs1dp_dec & "000" & imm12(3 downto 0) & imm12(11) & "1100011";
        elsif func3 = "111" then
            --bnez
            --expands to bne rs1′, x0, offset[8:1]
            imm12_ext6 := (others=>inst_i(12));
            imm12 := imm12_ext6(4 downto 0) & inst_i(6 downto 5) & inst_i(2)&inst_i(11 downto 10)&inst_i(4 downto 3);
            inst_o <= imm12(11) & imm12(9 downto 4) & "00000" & rs1dp_dec & "001" & imm12(3 downto 0) & imm12(11) & "1100011";
        else
        end if;
    elsif quad = "10" then
        if func3 = "000" then
            --slli
            --slli rd, rd, shamt[5:0]
            imm6 := inst_i(12) & inst_i(6 downto 2);
            inst_o <= "0000000" & imm6(5 downto 0)&rs1d&"001"&rs1d&"0010011";
        elsif func3 = "001" then
            -- reserved
        elsif func3 = "010" then
            -- lwsp
            -- lw rd,offset[7:2](x2)
            imm12 := "0000"&inst_i(3 downto 2)&inst_i(12)&inst_i(6 downto 4)&"00";
            inst_o <= imm12 & "00010" & "010" & rs1d&"0000011";
        elsif func3 = "011" then
            --reserved
        elsif func3 = "100" then
            --various
            if inst_i(12) = '0' and rs1d /= "00000" and rs2 = "00000" then
                --C.JR expands to jalr x0, 0(rs1).
                inst_o <= "000000000000"&rs1dp_dec&"000"&"00000"&"1100111";
            elsif inst_i(12) = '0' and rs1d = "00000" and rs2 /= "00000" then
                --c.mv add rd, x0, rs2
                inst_o <= "0000000"&rs2&"00000"&"000"&rs1d&"0110011";
            elsif inst_i(12) = '1' and rs1d = "00000" and rs2 = "00000" then
                --c.ebreak - ebreak
                inst_o <= "000000000001"&"00000"&"000"&"00000"&"1110011";
            elsif inst_i(12) = '1' and rs1d /= "00000" and rs2 = "00000" then
                --c.jalr -> jalr x1, 0(rs1).
                inst_o <= "000000000000"&rs1d&"000"&"00001"&"1100111";
            elsif inst_i(12) = '1' and rs1d /= "00000" and rs2 /= "00000" then
                --c.add -> add rd, rd, rs2
                inst_o <= "0000000"&rs2&rs1d&"000"&rs1d&"0110011";
            end if;
        elsif func3 = "101" then
            -- reserved
        elsif func3 = "110" then
            --swsp 
            -- sw rs2, offset[7:2](x2)
            imm12 := "00000"&inst_i(8 downto 7)&inst_i(12 downto 9)&"00";
            inst_o <= imm12(11 downto 5) & rs2 & "00010"&"010"&imm12(4 downto 0)&"0100011";

        elsif func3 = "111" then
            -- reserved 
        else
        end if;
    else
        --not necessarily invalid, just not compressed
    end if;


       
   end process decompress;


    
    
    
end architecture rtl;