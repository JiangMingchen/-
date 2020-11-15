library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MODEL_tb is
end MODEL_tb;

architecture modelsim of MODEL_tb is
component MODEL
PORT(
	WR_IN,CS_IN:IN STD_LOGIC;
	CLK_50M_IN:IN STD_LOGIC;
	CLR_IN:IN STD_LOGIC;
	RAM_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	RAM_ADDR:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	RESULT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
 );
end component;

component ACC0
	PORT(
	ADATA_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	IA:IN STD_LOGIC;
	EA:IN STD_LOGIC;
	CLK:IN STD_LOGIC;
	ADATA_OUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
end component;

component CLK_SOURCE0
	 PORT(
	 CLK_50M:IN STD_LOGIC;
    CLK:OUT STD_LOGIC
    );
end component;

component COUNTER0
	PORT(
	CLK,CLR:IN STD_LOGIC;
	T0,T1,T2,T3,T4,T5,T6,T7:OUT STD_LOGIC
	);
end component;

component IR0
	PORT(
	IDATA_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
   IIR:IN STD_LOGIC;
   CLK:IN STD_LOGIC;
   LD,ADD,SUB,AND1,OR1,MUL,HALT: OUT STD_LOGIC
  );
end component;

component PC0
	PORT(
	IPC,CLK,CLR:IN STD_LOGIC;
	PCOUT:OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
end component;

component ALU0
PORT(
	AC, DR: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	AIM: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ISUM: IN STD_LOGIC;
	ESUM: IN STD_LOGIC;
	ALU_OUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
end component;

component CTRL0
PORT(
	LD,ADD,SUB,AND1,OR1,MUL,HALT:IN STD_LOGIC;
	CLK:IN STD_LOGIC;
	T0,T1,T2,T3,T4,T5,T6,T7:IN STD_LOGIC; 
	AIM:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	IPC,IMAR,IDR,EDR,IA,EA,ISUM,ESUM,IIR:OUT STD_LOGIC
	);
end component;

component MAR0
PORT(
 ADDR_IN:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
 IMAR:IN STD_LOGIC;
 CLK:IN STD_LOGIC;
 ADDR_OUT:OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
 ); 
end component;

component DR0
PORT(
 DDATA_IN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 IDR:IN STD_LOGIC;
 EDR:IN STD_LOGIC;
 CLK:IN STD_LOGIC;
 DDATA_OUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
 );
end component;

component RAM0
 PORT(
 WR,CS:IN STD_LOGIC;
 DIN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
 DOUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
 ADDR:IN STD_LOGIC_VECTOR(2 DOWNTO 0)
 );
end component;

component SREG0
	port (DI: in std_logic_vector(15 downto 0);
			DO: out std_logic_vector(15 downto 0)
			);
end component;

component DBUS0
	port (INDATA1: in std_logic_vector(15 downto 0);
			INDATA2: in std_logic_vector(15 downto 0);
			OUTDATA: out std_logic_vector(15 downto 0)
			);
end component;

component MUX0
	PORT(
 DATA0:IN STD_LOGIC_VECTOR(2 DOWNTO 0):="ZZZ";
 DATA1:IN STD_LOGIC_VECTOR(2 DOWNTO 0):="ZZZ";
 WR:IN STD_LOGIC:='0';
 CHOOSE:OUT STD_LOGIC_VECTOR(2 DOWNTO 0):="ZZZ"
 ); 
end component;

signal adata_in :std_logic_vector(15 downto 0):="0000000000101010";--ACC
--signal ia :std_logic:='0';
--signal ea :std_logic:='0';
signal clk :std_logic:='0';
signal adata_out :std_logic_vector(15 downto 0):="0000000000000000";

--signal ipc :std_logic:='1';--PC
signal clr :std_logic:='0';
signal pcout :STD_LOGIC_VECTOR(2 DOWNTO 0):="000";

signal ac :std_logic_vector(15 downto 0):="0000000000001111";--ALU
signal dr :std_logic_vector(15 downto 0):="0000000011110000";
signal aim:std_logic_vector(3 downto 0):="0000";
--signal isum,esum :std_logic:='0';
signal alu_out :STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";

signal addr_in :std_logic_vector(2 downto 0):="000";--MAR
--signal imar :std_logic:='0';
signal addr_out :STD_LOGIC_VECTOR(2 DOWNTO 0):="000";

signal ld,add,sub,and1,or1,mul,halt:std_logic:='0';--CTRL
signal t0,t1,t2,t3,t4,t5,t6,t7:std_logic:='0';
signal ipc,imar,idr,edr,ia,ea,isum,esum,iir:std_logic:='0';

signal ddata_in :std_logic_vector(15 downto 0):="0000000000000000";--DR
signal ddata_out :STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";

--signal clk :std_logic:='0';--COUNTER
--signal clr :std_logic:='1';
--signal t0,t1,t2,t3,t4,t5,t6,t7:std_logic:='0';

signal addr :std_logic_vector(2 downto 0):="000";--RAM
signal wr,cs :std_logic:='0';
signal din,dout :STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";

signal clk_50m :std_logic:='0';--CLK_SOURCE
--signal clk :std_logic:='0';

signal idata_in :std_logic_vector(15 downto 0):="0000000000111110";--IR
--signal iir :std_logic:='0';

signal data0,data1,result_addr:std_logic_vector(2 downto 0):="ZZZ";
signal dbusin1,dbusin2:std_logic_vector(15 downto 0);
signal dbusout:std_logic_vector(15 downto 0);
--signal abus:std_logic_vector(2 downto 0);

signal clk_50m_in:std_logic:='0';
signal clr_in:std_logic:='0';
signal ram_addr :std_logic_vector(2 downto 0):="000";
signal wr_in,cs_in :std_logic:='0';
signal ram_in,result :STD_LOGIC_VECTOR(15 DOWNTO 0):="0000000000000000";

begin
a : MODEL port map(wr_in=>WR_IN,cs_in=>CS_IN,clk_50m_in=>CLK_50M_IN,clr_in=>CLR_IN,ram_in=>RAM_IN,
				       ram_addr=>RAM_ADDR,result=>RESULT);

--累加器
U0 : ACC0 port map(adata_in=>ADATA_IN,ia=>IA,ea=>EA,clk=>CLK,adata_out=>ADATA_OUT);
--运算器
U1 : ALU0 port map(ac=>AC,dr=>DR,aim=>AIM,isum=>ISUM,esum=>ESUM,alu_out=>ALU_OUT);
--时钟信号源
U2 : CLK_SOURCE0 port map(clk_50m=>CLK_50M,clk=>CLK);
--节拍发生器
U3 : COUNTER0 port map(clk=>CLK,clr=>CLR,t0=>T0,t1=>T1,t2=>T2,t3=>T3,t4=>T4,t5=>T5,t6=>T6,t7=>T7);
--控制器
U4 : CTRL0 port map(ld=>LD,add=>ADD,sub=>SUB,and1=>AND1,or1=>OR1,mul=>MUL,halt=>HALT,clk=>CLK,
						t0=>T0,t1=>T1,t2=>T2,t3=>T3,t4=>T4,t5=>T5,t6=>T6,t7=>T7,aim=>AIM,ipc=>IPC,imar=>IMAR,idr=>IDR,
						edr=>EDR,ia=>IA,ea=>EA,isum=>ISUM,esum=>ESUM,iir=>IIR);
--数据寄存器
U5 : DR0 port map(ddata_in=>DDATA_IN,idr=>IDR,edr=>EDR,clk=>CLK,ddata_out=>DDATA_OUT);
--指令寄存器
U6 : IR0 port map(idata_in=>IDATA_IN,clk=>CLK,iir=>IIR,ld=>LD,add=>ADD,sub=>SUB,and1=>AND1,or1=>OR1,mul=>MUL,
						halt=>HALT);
--地址寄存器
U7 : MAR0 port map(addr_in=>ADDR_IN,imar=>IMAR,clk=>CLK,addr_out=>ADDR_OUT);
--程序寄存器
U8 : PC0 port map(ipc=>IPC,clk=>CLK,clr=>CLR,pcout=>PCOUT);
--存储器
U9 : RAM0 port map(wr=>WR,cs=>CS,din=>DIN,dout=>DOUT,addr=>ADDR);
U10 : SREG0 port map(alu_out,dbusin2);
U11 : DBUS0 port map(dbusin1,dbusin2,dbusout);

--选择器
U12: MUX0 port map(data0,data1,wr,result_addr);
clk_50m<=clk_50m_in;
wr<=wr_in;
cs<=cs_in;
din<=ram_in;
clr<=clr_in;
addr_in<=pcout;
data0<=ram_addr;
data1<=addr_out;
addr<=result_addr;
ddata_in<=dout;
dbusin1<=ddata_out;
dr<=dbusout;
adata_in<=dbusout;
idata_in<=dbusout;
ac<=adata_out;
--dbus<=alu_out;
RESULT<=alu_out;
process
	begin
	ram_addr<="000";--LOAD A,6
	ram_in<="0000000000111110";
	wait for 200ns;
	ram_addr<="001";
	ram_in<="0000000000000110";
	wait for 200ns;
	ram_addr<="010";--ADD A,7
	ram_in<="0000000011000110";
	wait for 200ns;
	ram_addr<="011";
	ram_in<="0000000000000111";
	wait for 200ns;
	ram_addr<="100";--MUL A,157
	ram_in<="0101010101010101";
	wait for 200ns;
	ram_addr<="101";
	ram_in<="0000000010011101";
	wait for 200ns;
	ram_addr<="110";--OR A,1100
	ram_in<="0000000000001111";
	wait for 200ns;
	ram_addr<="111";
	ram_in<="0000000000001100";
	wait for 200ns;
end process;
process
	begin
	clk_50m_in<='1';
	wait for 5ns;
	clk_50m_in<='0';
	wait for 5ns;
end process;
process
	begin
	wr_in<='0';
	wait for 1600ns;
	wr_in<='1';
	wait;
end process;
process
	begin
	clr_in<='0';
	wait for 1600ns;
	clr_in<='1';
	wait;
end process;
end modelsim;