library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DR_tb is
end DR_tb;

architecture modelsim of DR_tb is
component DR0
PORT(
 DDATA_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 IDR:IN STD_LOGIC;
 EDR:IN STD_LOGIC;
 CLK:IN STD_LOGIC;
 DDATA_OUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
 );
end component;
signal ddata_in :std_logic_vector(15 downto 0):="0000000000000000";
signal clk :std_logic:='0';
signal idr,edr :std_logic:='1';
signal ddata_out :STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";
begin
a : DR0 port map(ddata_in=>DDATA_IN,idr=>IDR,edr=>EDR,clk=>CLK,ddata_out=>DDATA_OUT);
process
	begin
	ddata_in<="1111000011110000";
	wait for 200ns;
	ddata_in<="0000111100001111";
	wait for 200ns;
	ddata_in<="1010101010101010";
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