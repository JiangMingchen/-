library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MAR_tb is
end MAR_tb;

architecture modelsim of MAR_tb is
component MAR0
PORT(
 ADDR_IN:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
 IMAR:IN STD_LOGIC;
 CLK:IN STD_LOGIC;
 ADDR_OUT:OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
 ); 
end component;
signal addr_in :std_logic_vector(2 downto 0):="000";
signal imar :std_logic:='1';
signal clk :std_logic:='0';
signal addr_out :STD_LOGIC_VECTOR(2 DOWNTO 0):="000";
begin
a : MAR0 port map(addr_in=>ADDR_IN,imar=>IMAR,clk=>CLK,addr_out=>ADDR_OUT);
process
	begin
	addr_in<="001";
	wait for 200ns;
	addr_in<="010";
	wait for 200ns;
	addr_in<="100";
	wait for 200ns;
end process;
process
	begin
	clk<='1';
	wait for 100ns;
	clk<='0';
	wait for 100ns;
end process;
end modelsim;