library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity onyarv_alu is
    port (
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
end entity onyarv_alu;

architecture rtl of onyarv_alu is
    constant OP_SUB_ADD: std_logic_vector(2 downto 0) := "000";
    constant OP_SL: std_logic_vector(2 downto 0) := "001";
    constant OP_SLT: std_logic_vector(2 downto 0) := "010";
    constant OP_SLTU: std_logic_vector(2 downto 0) := "011";
    constant OP_XOR: std_logic_vector(2 downto 0) := "100";
    constant OP_SR: std_logic_vector(2 downto 0) := "101";
    constant OP_OR: std_logic_vector(2 downto 0) := "110";
    constant OP_AND: std_logic_vector(2 downto 0) := "111";
    signal shamt: unsigned(4 downto 0);
    signal dir: std_logic;
    signal arith: std_logic;
    signal shifter: std_logic_vector(31 downto 0);
    signal shifter_busy: std_logic;
begin
    core: process(clk_i, rst_i)
        variable shamt_var: unsigned(4 downto 0);
    begin
        shamt_var := unsigned(arg2_i(4 downto 0));
        if rst_i = '1' then
            shifter_busy <= '0';
        elsif rising_edge(clk_i) then
            if shifter_busy = '0' then
            case op_i is
                when OP_SUB_ADD =>
                    if alu_sub_i = '1' then
                        res_o <= std_logic_vector(signed(arg1_i) - signed(arg2_i));
                    else
                        res_o <= std_logic_vector(signed(arg1_i) + signed(arg2_i));
                    end if;
                    res_valid_o <= '1';
                when OP_SL => 
                    -- boring shifter
                    -- latch args and do first shift
                    -- We dont have to care about arith shifts
                    if shamt_var = "00000" then
                          -- do nothing
                        res_valid_o <= '1';
                        res_o <= arg1_i;
                    elsif shamt_var = "00001" then
                        res_valid_o <= '1';
                        res_o <= arg1_i(30 downto 0) & '0';
                    else
                        res_valid_o <= '0';
                        shifter_busy <= '1';
                        dir <= '0';
                        shifter <= arg1_i(30 downto 0) & '0';
                        shamt <= shamt_var-1;
                    end if; 
                    
                    
                when OP_SLT => -- set to 1 if a1 < a2
                if signed(arg1_i) < signed(arg2_i) then
                    res_o <= (0=> '1', others=>'0');
                else
                    res_o <= (others=>'0');
                end if;
                res_valid_o <= '1';
                when OP_SLTU => -- set to 1 if a1 < a2 unsigned
                    if unsigned(arg1_i) < unsigned(arg2_i) then
                        res_o <= (0=> '1', others=>'0');
                    else
                        res_o <= (others=>'0');
                    end if;
                    res_valid_o <= '1';
                when OP_XOR =>
                    res_o <= arg1_i xor arg2_i;
                    res_valid_o <= '1';
                when OP_SR =>
                if shamt_var = "00000" then
                    -- do nothing
                    res_valid_o <= '1';
                    res_o <= arg1_i;
                elsif shamt_var = "00001" then
                    res_valid_o <= '1';
                    if shift_arith_i = '1' then
                        -- arith shift
                        res_o <= arg1_i(31) & arg1_i(31 downto 1);
                    else
                        res_o <= '0' & arg1_i(31 downto 1);
                    end if;
                else
                    --multi cylce shift 
                    res_valid_o <= '0';
                    shifter_busy <= '1';
                    dir <= '1';
                    arith <= shift_arith_i;
                    if shift_arith_i = '1' then
                        -- arith shift
                        shifter <= arg1_i(31) & arg1_i(31 downto 1);
                    else
                        shifter <= '0' & arg1_i(31 downto 1);
                    end if;
                    shamt <= shamt_var-1;
                end if;
                
                when OP_OR => 
                    res_o <= arg1_i or arg2_i;
                    res_valid_o <= '1';
                when OP_AND =>
                    res_o <= arg1_i and arg2_i;
                    res_valid_o <= '1';
                when others =>
                    
            end case;
        else
            -- shifter op
            if dir = '0' then -- shift left
                if shamt = 1 then -- last op
                    res_o <= shifter(30 downto 0) & '0';
                    shamt <= "00000";
                    shifter_busy <= '0';
                    res_valid_o <= '1';
                else
                    shifter <= shifter(30 downto 0) & '0';
                    shamt <= shamt-1;
                end if;
            else
                if shamt = 1 then -- last op
                    if arith = '1' then
                        -- arith shift
                        res_o <= shifter(31) & shifter(31 downto 1);
                    else
                        res_o <= '0' & shifter(31 downto 1);
                    end if;
                    shamt <= "00000";
                    shifter_busy <= '0';
                    res_valid_o <= '1';
                else
                    if arith = '1' then
                        -- arith shift
                        shifter <= shifter(31) & shifter(31 downto 1);
                    else
                        shifter <= '0' & shifter(31 downto 1);
                    end if;
                    shamt <= shamt-1;
                end if;
            end if;
        end if;

        end if;
    end process core;
    
    
end architecture rtl;