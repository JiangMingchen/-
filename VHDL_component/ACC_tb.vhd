library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ACC_tb is
end ACC_tb;

architecture modelsim of ACC_tb is
component ACC0
	PORT(
	ADATA_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	IA:IN STD_LOGIC;
	EA:IN STD_LOGIC;
	CLK:IN STD_LOGIC;
	ADATA_OUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
	end component;
signal adata_in :std_logic_vector(15 downto 0):="0010101000101010";
signal ia :std_logic:='0';
signal ea :std_logic:='0';
signal clk :std_logic:='0';
signal adata_out :std_logic_vector(15 downto 0):="0000000000000000";
begin
a : ACC0 port map(adata_in,ia,ea,clk,adata_out);
process
	begin
	clk <= '1';
	wait for 200ns;
	clk <= '0';
	wait for 200ns;
end process;
process
	begin
	adata_in <= "0000000000001111";
	wait for 400ns;
	adata_in <= "0000000011110000";
	wait for 400ns;
end process;
process
	begin
	ia <= '1';
	ea <= '0';
	wait for 200ns;
	ia <= '0';
	ea <= '1';
	wait for 200ns;
end process;
end modelsim;