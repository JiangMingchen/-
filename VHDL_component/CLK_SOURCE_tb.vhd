library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CLK_SOURCE_tb is
end CLK_SOURCE_tb;

architecture modelsim of CLK_SOURCE_tb is
component CLK_SOURCE0
	PORT(
	CLK_50M:IN STD_LOGIC;
	CLK:OUT STD_LOGIC
	);
end component;
signal clk_50m :std_logic:='0';
signal clk :std_logic:='0';
begin
a : CLK_SOURCE0 port map(clk_50m=>CLK_50M,clk=>CLK);
process
	begin
	clk_50m <= '1';
	wait for 50ns;
	clk_50m <= '0';
	wait for 50ns;
end process;
end modelsim;