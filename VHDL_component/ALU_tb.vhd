library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU_tb is
end ALU_tb;

architecture modelsim of ALU_tb is
component ALU0
PORT(
 AC, DR: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 AIM: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 ISUM: IN STD_LOGIC;
 ESUM: IN STD_LOGIC;
 ALU_OUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
 );
end component;
signal ac :std_logic_vector(15 downto 0):="0000000000001111";
signal dr :std_logic_vector(15 downto 0):="0000000011110000";
signal isum,esum :std_logic:='0';
signal aim:std_logic_vector(3 downto 0):="0001";
signal alu_out :STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";
begin
a : ALU0 port map(ac=>AC,dr=>DR,aim=>AIM,isum=>ISUM,esum=>ESUM,alu_out=>ALU_OUT);
process
	begin
	ac<="0000000000001111";
	dr<="0000000011110000";
	aim<="0001";
	wait for 200ns;
	ac<="0000000011111111";
	dr<="0000000011110000";
	aim<="0010";
	wait for 200ns;
	ac<="0000000000001111";
	dr<="0000000011110000";
	aim<="0011";
	wait for 200ns;
	ac<="0000000000001111";
	dr<="0000000011110000";
	aim<="0100";
	wait for 200ns;
	ac<="0000000000001101";
	dr<="0000000000000111";
	aim<="1101";
	wait for 200ns;
end process;
process
	begin
	isum<='1';
	esum<='0';
	wait for 100ns;
	isum<='0';
	esum<='1';
	wait for 100ns;
end process;
end modelsim;