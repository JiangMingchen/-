# -
数字逻辑与数字系统课程设计，由八位模型机设计改进而来    
From 东北大学计算机学院(School of Computer Science and Engineering,NEU)

采用VHDL语言设计，其中VHDL_component为模型机中的各个元件，包括：  

>ACC        累加器     
ALU         运算器（包括加、减、乘、与、或运算）    
CLK_SOURCE  时钟信号源    
COUNTER     节拍发生器    
CTRL        控制器    
DBUS        数据总线    
DR          数据寄存器      
IR          指令寄存器        
MAR         地址寄存器        
MUX         选择器（决定读/写指令）         
PC          程序计数器           
RAM         存储器             

注：其中_tb文件是测试向量，仿真时使用。       

VHDL_system为顶层设计，即将所有元件整合为系统，其中_tb是测试向量，仿真时使用。    

使用方法：    
使用Quartus将所有非_tb的vhd文件放到一个工程中后编译，编译成功即可使用_tb文件进行仿真。    
