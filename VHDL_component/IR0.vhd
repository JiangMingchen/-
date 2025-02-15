LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY IR0 IS
PORT(
 IDATA_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 IIR:IN STD_LOGIC;
 CLK:IN STD_LOGIC;
 LD,ADD,SUB,AND1,OR1,MUL,HALT: OUT STD_LOGIC:='0'
 );
END IR0;
ARCHITECTURE A OF IR0 IS
SIGNAL REGQ: STD_LOGIC_VECTOR(15 DOWNTO 0); 
--signal init: std_logic:='0';
BEGIN
 PROCESS(CLK,IIR)
 BEGIN
 IF(CLK'EVENT AND CLK='1') THEN
 IF(IIR='1') THEN
 REGQ<=IDATA_IN;
 --init<='1';
 END IF;
 END IF;
 END PROCESS;

 PROCESS(CLK,REGQ)
 BEGIN
 CASE REGQ IS
 WHEN "0000000000111110" =>LD<='1';ADD<='0';SUB<='0';AND1<='0';OR1<='0';MUL<='0';HALT<='0';--LOAD A
 WHEN "0000000011000110" =>LD<='0';ADD<='1';SUB<='0';AND1<='0';OR1<='0';MUL<='0';HALT<='0';--加法
 WHEN "0000000001110110" =>LD<='0';ADD<='0';SUB<='0';AND1<='0';OR1<='0';MUL<='0';HALT<='1';--停机
 WHEN "0000000000111001" =>LD<='0';ADD<='0';SUB<='1';AND1<='0';OR1<='0';MUL<='0';HALT<='0';--减法
 WHEN "0000000011110000" =>LD<='0';ADD<='0';SUB<='0';AND1<='1';OR1<='0';MUL<='0';HALT<='0';--与
 WHEN "0000000000001111" =>LD<='0';ADD<='0';SUB<='0';AND1<='0';OR1<='1';MUL<='0';HALT<='0';--或
 WHEN "0101010101010101" =>LD<='0';ADD<='0';SUB<='0';AND1<='0';OR1<='0';MUL<='1';HALT<='0';--乘
 WHEN OTHERS =>NULL;
 END CASE;
 END PROCESS;
END A; 