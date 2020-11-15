library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RAM_tb is
end RAM_tb;

architecture modelsim of RAM_tb is
component RAM0
 PORT(
 WR,CS:IN STD_LOGIC;
 DIN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 DOUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
 ADDR:IN STD_LOGIC_VECTOR(2 DOWNTO 0)
 );
end component;
signal addr :std_logic_vector(2 downto 0):="000";
signal wr,cs :std_logic:='1';
signal din,dout :STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";
begin
a : RAM0 port map(wr=>WR,cs=>CS,din=>DIN,dout=>DOUT,addr=>ADDR);
process
	begin
	addr<="001";
	din<="1111111111111111";
	wait for 200ns;
	addr<="010";
	din<="0000000000000000";
	wait for 200ns;
	addr<="100";
	din<="0000111100001111";
	wait for 200ns;
end process;
process
	begin
	wr<='0';
	wait for 600ns;
	wr<='1';
	wait for 600ns;
end process;
process
	begin
	cs<='0';
	wait for 100ns;
	cs<='1';
	wait for 100ns;
end process;
end modelsim;