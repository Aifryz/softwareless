library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity onyarv_cpu_tb is
end entity onyarv_cpu_tb;


architecture tb of onyarv_cpu_tb is
    component onyarv_cpu port (
        rst_i: in std_logic;
        clk_i: in std_logic;
        -- Instruction bus
        ins_adr_o: out std_logic_vector(31 downto 0);
        ins_dat_i: in std_logic_vector(31 downto 0);
        ins_stb_o: out std_logic;
        ins_ack_i: in std_logic;
        ins_cyc_o: out std_logic;
        -- Data bus
        data_addr_o: out std_logic_vector(31 downto 0);
        data_dat_i: in std_logic_vector(31 downto 0);
        data_dat_o: out std_logic_vector(31 downto 0);
        data_we_o: out std_logic;
        data_sel_o: out std_logic_vector(3 downto 0);
        data_stb_o: out std_logic;
        data_ack_i: in std_logic;
        data_cyc_o: out std_logic;
        -- debug signals
        stall_i: std_logic;
        irq_i: std_logic
    );
    end component;

    signal clk_i: std_logic := '0';
    signal rst_i: std_logic := '1';

    signal ins_adr_o: std_logic_vector(31 downto 0);
    signal ins_dat_i: std_logic_vector(31 downto 0);
    signal ins_stb_o: std_logic;
    signal ins_ack_i: std_logic;
    signal ins_cyc_o: std_logic;
    -- Data bus
    signal data_addr_o: std_logic_vector(31 downto 0);
    signal data_dat_i: std_logic_vector(31 downto 0);
    signal data_dat_o: std_logic_vector(31 downto 0);
    signal data_we_o: std_logic;
    signal data_sel_o: std_logic_vector(3 downto 0);
    signal data_stb_o: std_logic;
    signal data_ack_i: std_logic;
    signal data_cyc_o: std_logic;
    -- debug signals
    signal stall_i: std_logic;
    signal irq_i: std_logic;


    constant CLK_PERIOD: time := 10 ns;

    type mem_arr is array(0 to 5) of std_logic_vector(31 downto 0);

begin
    clk_i <= not clk_i after CLK_PERIOD/2;

    UUT: onyarv_cpu port map(
        rst_i	=>	rst_i,
        clk_i	=>	clk_i,
        -- Instruction bus			
        ins_adr_o	=>	ins_adr_o,
        ins_dat_i	=>	ins_dat_i,
        ins_stb_o	=>	ins_stb_o,
        ins_ack_i	=>	ins_ack_i,
        ins_cyc_o	=>	ins_cyc_o,
        -- Data bus			
        data_addr_o	=>	data_addr_o,
        data_dat_i	=>	data_dat_i,
        data_dat_o	=>	data_dat_o,
        data_we_o	=>	data_we_o,
        data_sel_o	=>	data_sel_o,
        data_stb_o	=>	data_stb_o,
        data_ack_i	=>	data_ack_i,
        data_cyc_o	=>	data_cyc_o,
        -- debug signals			
        stall_i	=>	stall_i,
        irq_i	=>	irq_i	

    );

    stimulus: process
    begin
        wait for 50 ns;
        rst_i <= '0';
        wait for 10 ns;
        assert 0=1 report "Simulation end" severity note;

        wait;
        
    end process stimulus;

    wb_instr_data: process is
    variable mem: mem_arr := (
        -- addi r1, r0, 1
        "000000000001" & "00000" & "000" & "00001" & "0010011", 
        -- addi r2, r0, 2
        "000000000010" & "00000" & "000" & "00010" & "0010011", 
        -- add r3, r1, r2
        "0000000" & "00010" & "00001" & "000" & "00011" & "0110011", 
        -- addi r4, r2, 5
        "000000000101" & "00010" & "000" & "00100" & "0010011", 
        
        -- compressed part
        -- c.li r1, 1
        -- c.li r2, 2
        "010" & "0" & "00010" & "00010" & "01"&
        "010" & "0" & "00001" & "00001" & "01", 
        
        -- c.add r1, r2
        -- c.addi r2, 5
        "000" & "0" & "00010" & "00101" & "01"&
        "100" & "1" & "00001" & "00010" & "10" 
        
    );
    variable adr: integer;
   begin
    wait until rising_edge(clk_i);
        if rst_i = '0' then
            if ins_stb_o = '1' then
                adr := to_integer(unsigned(ins_adr_o(5 downto 2)));
                ins_dat_i <= std_logic_vector(mem(adr));
                ins_ack_i <= '1';
            else
                ins_ack_i <= '0';
            end if;

        else
            ins_ack_i <= '0';
        end if;
   end process wb_instr_data;
    
    
    
end architecture tb;