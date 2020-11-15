library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity SREG0 IS
	port (DI: in std_logic_vector(15 downto 0);
			DO: out std_logic_vector(15 downto 0)
			);
end SREG0;

architecture A of SREG0 is
begin
	DO<= DI;
end A;