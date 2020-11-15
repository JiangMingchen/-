library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC_tb is
end PC_tb;

architecture modelsim of PC_tb is
component PC0
	PORT(
	IPC,CLK,CLR:IN STD_LOGIC;
	PCOUT:OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
end component;
signal ipc :std_logic:='1';
signal clk,clr :std_logic:='0';
signal pcout :STD_LOGIC_VECTOR(2 DOWNTO 0):="000";
begin
a : PC0 port map(ipc=>IPC,clk=>CLK,clr=>CLR,pcout=>PCOUT);
process
	begin
	clk <= '1';
	clr <= '1';
	wait for 200ns;
	clk <= '0';
	clr <= '1';
	wait for 200ns;
end process;
end modelsim;