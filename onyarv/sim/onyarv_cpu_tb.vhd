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

    type mem_arr is array(0 to 255) of std_logic_vector(31 downto 0);

    -- Swap order to halfworlds
    -- Used to define instructions so that lower PC instructions appear in code first
    function halfswap(
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0))
        return std_logic_vector is
    begin
        return b&a;
    end function halfswap;

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
        halfswap(
        "010" & "0" & "00001" & "00001" & "01",  -- c.li r1, 1
        "010" & "0" & "00010" & "00010" & "01"), -- c.li r2, 2
        halfswap(
        "100" & "1" & "00001" & "00010" & "10",  -- c.add r1, r2
        "000" & "0" & "00010" & "00101" & "01"), -- c.addi r2, 5
        halfswap(
        "010" & "0" & "01010" & "00111" & "01",  --   c.li x10, 7
                                                 -- loop:
        "110" & "000" & "010" & "00110" & "01"), --   c.beqz done (+6)
        halfswap(
        "000" & "1" & "01010" & "11111" & "01", --    c.addi x10, -1
        "101" & "11111111101" & "01"),          --    c.j loop (-4)
        halfswap(
        "010" & "0" & "01010" & "01010" & "01", --    c.li x10, 10
        "0000000000000001"),                     --    c. nop

        -- function calls section
        -- jump 0x0001 0000
        --c.lui 0x00010000, clip bottom bits
        --c.lui t1, 0x00010
        -- c.jalr, t1
        -- here should be the return code
        -- c.mv t6, a0

        halfswap(
        "010" & "0" & "01010" & "10001" & "01",  --    c.li a0/, 17
        "011" & "0" & "00110" & "10000" & "01"),  --   c.lui t1, 0x00010 [000]
        halfswap(
        "100" & "1" & "00110" & "00000" & "10",  --    c.jalr, t1
        "100" & "0" & "11111" & "01010" & "10"),  --   c.mv t6, a0

        others => x"00010001"
        
    ); 

    variable hi_mem: mem_arr := (
        -- 0x0001 0000: add3
        -- c.addi a0, 3
        -- c.ret (c.jr x1)

        -- 0x0001 0004: fib_iter
        -- slti a2, 2
        -- c.beqz fib_iter_loop

        -- c.mv a1, a0 ; copy arg
        -- 
        -- fib_iter_end:
        -- c.ret (c.jr x1)

        others => x"00010001"
    );
    variable adr: integer;
    constant hi_mem_start:integer := 16#00010000#;
   begin
    wait until rising_edge(clk_i);
        if rst_i = '0' then
            if ins_stb_o = '1' then
                adr := to_integer(unsigned(ins_adr_o(20 downto 2)));
                if adr < 256 then  -- low mem
                    ins_dat_i <= std_logic_vector(mem(adr));
                elsif adr >= hi_mem_start  and adr < hi_mem_start+256 then 
                    ins_dat_i <= std_logic_vector(mem(adr-hi_mem_start));
                else
                    ins_dat_i <= x"00010001"; --c.nop
                end if;
                ins_ack_i <= '1';
            else
                ins_ack_i <= '0';
            end if;

        else
            ins_ack_i <= '0';
        end if;
   end process wb_instr_data;
    
    
    
end architecture tb;