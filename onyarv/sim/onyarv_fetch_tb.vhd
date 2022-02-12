library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity onyarv_fetch_tb is
end entity onyarv_fetch_tb;

architecture rtl of onyarv_fetch_tb is
    constant CLK_PERIOD: time := 10 ns;
    component onyarv_fetch port (
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
    end component;

    signal rst_i:  std_logic;
    signal clk_i:  std_logic := '1';

    signal ins_adr_o:  std_logic_vector(31 downto 0);
    signal ins_dat_i:  std_logic_vector(31 downto 0);
    signal ins_stb_o:  std_logic;
    signal ins_ack_i:  std_logic;
    signal ins_cyc_o:  std_logic;

    signal instr_o:  std_logic_vector(31 downto 0);
    signal instr_len_o:  std_logic;
    signal instr_valid_o: std_logic; 
    signal err_o: std_logic;

    signal addr_i:  std_logic_vector(31 downto 0);
    signal load_i:  std_logic;

    signal data: unsigned(31 downto 0);

    type mem_arr is array(0 to 7) of std_logic_vector(31 downto 0);

begin
    clk_i <= not clk_i after CLK_PERIOD/2;
    
    
    UUT: onyarv_fetch port map(
        rst_i => rst_i,
        clk_i => clk_i,
        ins_adr_o =>ins_adr_o,
        ins_dat_i=>ins_dat_i,
        ins_stb_o=>ins_stb_o,
        ins_ack_i=>ins_ack_i,
        ins_cyc_o=>ins_cyc_o,
        instr_o=>instr_o,
        instr_len_o=>instr_len_o,
        instr_valid_o=>instr_valid_o,
        err_o=>err_o,
        addr_i=>addr_i,
        load_i=>load_i
    );

    stimulus: process is
    begin
        rst_i <= '1';
        wait for 50 ns;
        rst_i <= '0';
        wait for 50 ns;
        wait until falling_edge(clk_i);
        load_i <= '1';
        addr_i <= x"00000000"; -- not cached, aligned 32 bit
        wait until rising_edge(instr_valid_o);
        wait until falling_edge(clk_i);
        addr_i <= x"00000004"; -- not cached 16, aligned
        wait until rising_edge(instr_valid_o);
        wait until falling_edge(clk_i);
        addr_i <= x"00000006"; -- cached 16, not aligned
        wait until rising_edge(instr_valid_o);
        wait until falling_edge(clk_i);
        addr_i <= x"00000008"; -- not cached 16, aligned
        wait until rising_edge(instr_valid_o);
        wait until falling_edge(clk_i);
        addr_i <= x"0000000A"; -- cached, 32 not aligned
        wait until rising_edge(instr_valid_o);
        wait until falling_edge(clk_i);
        addr_i <= x"00000016"; -- 32 bit not aligned, not cached
        wait until rising_edge(instr_valid_o);
        wait until falling_edge(clk_i);
        addr_i <= x"0000001A"; -- 32 bit not aligned, cached


        wait for 1 us;
        wait;
    end process stimulus;

    -- asynchronous acknowledge of wishbone strobe
    -- plus some offset to make trace visualisation easier
    ins_ack_i <= ins_stb_o after CLK_PERIOD/4;

   wb_data: process is
    variable mem: mem_arr := (
        x"0000100F", -- 32 bit instruction, normal span
        x"22383678", -- 16 bit instruction, then another 16 bit instruction
        x"400F5678", -- 16 bit instruction, then not aligned lower word of 32 bit instruction
        x"62387BAB", -- remainder of 32 bit instruction, then not aligned 16 bit
        x"823F967F",
        x"A23FB67F",
        x"C23FD67F",
        x"E23F567F"
    );
    variable adr: integer;
   begin
    wait until rising_edge(ins_ack_i);
        --data <= data+1;
        -- get word address
        adr := to_integer(unsigned(ins_adr_o(5 downto 2)));
        ins_dat_i <= std_logic_vector(mem(adr));
        
   end process wb_data;


    
    
end architecture rtl;