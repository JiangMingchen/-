library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity COUNTER_tb is
end COUNTER_tb;

architecture modelsim of COUNTER_tb is
component COUNTER0
	PORT(
	CLK,CLR:IN STD_LOGIC;
	T0,T1,T2,T3,T4,T5,T6,T7:OUT STD_LOGIC
	);
end component;
signal clk :std_logic:='0';
signal clr :std_logic:='1';
signal t0,t1,t2,t3,t4,t5,t6,t7:std_logic:='0';
begin
a : COUNTER0 port map(clk,clr,t0,t1,t2,t3,t4,t5,t6,t7);
process
	begin
	clk <= '1';
	wait for 200ns;
	clk <= '0';
	wait for 200ns;
end process;
process
	begin
	clr <= '0';
	wait for 200ns;
	clr <='1';
	wait for 3200ns;
end process;
end modelsim;