LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY CTRL0 IS
 PORT(
 LD,ADD,SUB,AND1,OR1,MUL,HALT:IN STD_LOGIC;
 CLK:IN STD_LOGIC;
 T0,T1,T2,T3,T4,T5,T6,T7:IN STD_LOGIC;
 AIM:OUT STD_LOGIC_VECTOR(3 DOWNTO 0):="ZZZZ";
 IPC,IMAR,IDR,EDR,IA,EA,ISUM,ESUM,IIR:OUT STD_LOGIC
 );
END ENTITY;
ARCHITECTURE A OF CTRL0 IS
SIGNAL DOUBLE:STD_LOGIC:='0';
SIGNAL IPC_TEMP,IMAR_TEMP,IDR_TEMP,EDR_TEMP,IA_TEMP,EA_TEMP,ISUM_TEMP,ESUM_TEMP,IIR_TEMP: STD_LOGIC:='0';
BEGIN
IPC<=IPC_TEMP;
IMAR<=IMAR_TEMP;
IDR<=IDR_TEMP;
EDR<=EDR_TEMP;
IA<=IA_TEMP;
EA<=EA_TEMP;
ISUM<=ISUM_TEMP;
ESUM<=ESUM_TEMP;
IIR<=IIR_TEMP;
DOUBLE<=((ADD OR SUB) OR ((AND1 OR OR1) OR MUL));

 PROCESS(LD,DOUBLE,HALT,T0,T1,T2,T3,T4,T5,T6,T7)
 BEGIN
 IF(HALT='1') THEN
 IPC_TEMP<='0';IIR_TEMP<='0';EDR_TEMP<='0';
 END IF;
 
 IF(T0='1') THEN
	IMAR_TEMP<='1';
 ELSIF(T1='1') THEN
	IMAR_TEMP<='0';IDR_TEMP<='1';EDR_TEMP<='1';IIR_TEMP<='1';
 ELSIF(T2='1') THEN
	IDR_TEMP<='0';IPC_TEMP<='1';
 END IF;	
 
 IF(LD='1') THEN
	IF(T3='1') THEN
	IPC_TEMP<='0';IIR_TEMP<='0';IMAR_TEMP<='1';
	ELSIF(T4='1') THEN
		IDR_TEMP<='1';EDR_TEMP<='1';
	ELSIF(T5='1') THEN
		IPC_TEMP<='1';
	ELSIF(T6='1') THEN
		IPC_TEMP<='0';IA_TEMP<='1';
	ELSIF(T7='1') THEN
	IA_TEMP<='0';EA_TEMP<='0';
	END IF;
 ELSIF(DOUBLE='1') THEN
	IF(T3='1') THEN
		IPC_TEMP<='0';IIR_TEMP<='0';IMAR_TEMP<='1';
	ELSIF(T4='1') THEN
		IMAR_TEMP<='0';IDR_TEMP<='1';EDR_TEMP<='1';
	ELSIF(T5='1') THEN
		IDR_TEMP<='0';IPC_TEMP<='1';ISUM_TEMP<='1';EA_TEMP<='1';
	ELSIF(T6='1') THEN
		IPC_TEMP<='0';ISUM_TEMP<='0';ESUM_TEMP<='1';EDR_TEMP<='0';IA_TEMP<='1';EA_TEMP<='0';
	ELSIF(T7='1') THEN
		IA_TEMP<='0';ESUM_TEMP<='0';
	END IF;
 END IF;
 END PROCESS;

 PROCESS(ADD,SUB,AND1,OR1,MUL)
 BEGIN
 IF(ADD='1') THEN
	AIM<="0001";
 ELSIF(SUB='1') THEN
   AIM<="0010";
 ELSIF(AND1='1') THEN
   AIM<="0011";
 ELSIF(OR1='1') THEN
   AIM<="0100";
 ELSIF(MUL='1') THEN
   AIM<="1101";
 END IF;
 END PROCESS;
END A; 