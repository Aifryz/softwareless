library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--fetch unit, fetches 

entity onyarv_fetch is
    port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        -- Instruction bus
        ins_adr_o: out std_logic_vector(31 downto 0);
        ins_dat_i: in std_logic_vector(31 downto 0);
        ins_stb_o: out std_logic;
        ins_ack_i: in std_logic;
        ins_cyc_o: out std_logic;
        -- Output bus
        instr_o: out std_logic_vector(31 downto 0);
        instr_len_o: out std_logic; -- 1 when instr is 4 bytes, 2 otherwise
        instr_valid_o: out std_logic; 
        err_o: out std_logic;
        -- Address to load (PC)
        addr_i: in std_logic_vector(31 downto 0);
        load_i: in std_logic
    );
end entity onyarv_fetch;

architecture rtl of onyarv_fetch is
    -- ucache, single upper word
    signal cached_halfword: std_logic_vector(15 downto 0);
    signal cached_addr: std_logic_vector(31 downto 0);
    signal ucache_hit: std_logic;
    signal ucache_valid: std_logic;
    signal is_addr_aligned: std_logic;
    signal cached_compressed: std_logic;
    signal is_waiting_for_data: std_logic;
    signal next_word_addr_unaligned: std_logic_vector(31 downto 0);
    signal next_word_addr: std_logic_vector(31 downto 0);
   
begin

   proc: process(clk_i, rst_i)
   begin
       if rst_i = '1' then
           instr_o <= (others=>'0');
           instr_len_o <= '1';
           instr_valid_o <= '0';
           err_o <= '0';
           ucache_valid <= '0';
           is_waiting_for_data <= '0';
           ins_stb_o <= '0';
            ins_cyc_o <= '0';
       elsif rising_edge(clk_i) then
        if load_i = '1' and is_waiting_for_data = '0' then
            instr_valid_o <= '0';
            if ucache_hit = '1' then
                if cached_compressed = '1' then
                    --done, decompress
                    --TODO
                    instr_valid_o <= '1';
                    instr_o <= x"deadcafe";
                else
                    --we have only the lower halfword, we need to fetch upper part
                    ins_stb_o <= '1';
                    ins_cyc_o <= '1';
                    is_waiting_for_data <= '1';
                    ins_adr_o <= next_word_addr;
                end if;
            else -- not cached
                ins_stb_o <= '1';
                ins_cyc_o <= '1';
                is_waiting_for_data <= '1';
                -- only do aligned loads on bus
                ins_adr_o <= addr_i(31 downto 2) & "00";
            end if;
            -- second stage
        elsif is_waiting_for_data = '1' and ins_ack_i = '1' then
            ins_stb_o <= '0';
            ins_cyc_o <= '0';
            is_waiting_for_data <= '0';
            -- Invalidate cache
            ucache_valid <= '0';

            if ucache_hit = '1' then
                -- if cache is hit in second stage, that means that the instruction is 32 bit with lower halfword already cached
                -- we have the upper word
                instr_valid_o <= '1';
                instr_o <= ins_dat_i(15 downto 0) & cached_halfword;
                ucache_valid <= '1';
                cached_addr <= next_word_addr(31 downto 2) & "10";
                cached_halfword <= ins_dat_i(31 downto 16);
            else
                if is_addr_aligned = '1' then -- lsbits in lsbits of data
                    if ins_dat_i(1 downto 0) /= "11" then -- compressed
                        -- cache upper word
                        cached_halfword <= ins_dat_i(31 downto 16);
                        ucache_valid <= '1';
                        cached_addr <= next_word_addr(31 downto 2) & "10";
                        -- decompress lower and write to out 
                        --TODO
                        instr_valid_o <= '1';
                        instr_o <= x"deadcafe";
                    else
                        -- fetched valid address
                        instr_valid_o <= '1';
                        instr_o <= ins_dat_i(31 downto 0);
                    end if;
                else -- instruction lsbits are in higher word
                    if ins_dat_i(17 downto 16) /= "11" then -- compressed
                        --valid compressed instruction in higher word
                        --decompress higher and write to out
                        --TODO
                        instr_valid_o <= '1';
                        instr_o <= x"deadcafe";
                    else
                        -- need to fetch another word to get higher word of instruction
                        -- cache current word
                        cached_halfword <= ins_dat_i(31 downto 16);
                        ucache_valid <= '1';
                        cached_addr <= addr_i;
                    end if;
                end if;
            end if;
        end if;

       end if;
   end process proc;
   
    --is requested adress cached?
    ucache_hit <= '1' when 
        cached_addr(31 downto 1) = addr_i(31 downto 1) and 
        ucache_valid = '1'
    else '0'; 

    -- is requested address aligned
    is_addr_aligned <=  '1' when addr_i(1) = '0'
    else '0';
    

    cached_compressed <= '1' when cached_halfword(1 downto 0) /= "11";
    
    next_word_addr_unaligned <= std_logic_vector(unsigned(addr_i)+4);
    next_word_addr <= next_word_addr_unaligned(31 downto 2) & "00";


   
   

    
    
end architecture rtl;