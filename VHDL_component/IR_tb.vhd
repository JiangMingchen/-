library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity IR_tb is
end IR_tb;

architecture modelsim of IR_tb is
component IR0
PORT(
 IDATA_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 IIR:IN STD_LOGIC;
 CLK:IN STD_LOGIC;
 LD,ADD,SUB,AND1,OR1,MUL,HALT: OUT STD_LOGIC:='0'
 );
end component;
signal idata_in :std_logic_vector(15 downto 0):="0000000000111110";
signal clk :std_logic:='0';
signal iir :std_logic:='1';
signal ld,add,sub,and1,or1,mul,halt:std_logic:='0';
begin
a : IR0 port map(idata_in=>IDATA_IN,clk=>CLK,iir=>IIR,ld=>LD,add=>ADD,sub=>SUB,and1=>AND1,or1=>OR1,mul=>MUL,halt=>HALT);
process
	begin
	clk <= '1';
	wait for 200ns;
	clk <= '0';
	wait for 200ns;
end process;
process
	begin
	idata_in <= "0000000000111110";--LD
	wait for 400ns;
	idata_in <="0000000011000110";--ADD
	wait for 400ns;
	idata_in <= "0000000000111001";--SUB
	wait for 400ns;
	idata_in <= "0000000011110000";--AND
	wait for 400ns;
	idata_in <= "0000000000001111";--OR
	wait for 400ns;
	idata_in <= "0101010101010101";--MUL
	wait for 400ns;
	idata_in <="0000000001110110";--HALT
	wait for 400ns;
end process;
end modelsim;