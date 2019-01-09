library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mips is
 port ( clk, bytein, reset : in std_logic);
end Mips;

architecture Behavioral of Mips is

component Register_Mem is port ( clk : in  STD_LOGIC;
read_reg_1 : in  STD_LOGIC_VECTOR (4 downto 0);           
read_reg_2 : in  STD_LOGIC_VECTOR (4 downto 0);           
write_reg : in  STD_LOGIC_VECTOR (4 downto 0);           
signal_reg_write : in  STD_LOGIC;           
write_data : in  STD_LOGIC_VECTOR (31 downto 0);           
read_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);           
read_data_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component Register_Mem;

component InstructionFile is port ( readadress : in STD_LOGIC_VECTOR (31 downto 0);
instruction : out STD_LOGIC_VECTOR (31 downto 0));           
end component InstructionFile; 

component ALu_Control is port (in_function : in STD_LOGIC_VECTOR (5 downto 0);
AluOp : in STD_LOGIC_VECTOR (1 downto 0);
AluControl : out STD_LOGIC_VECTOR (2 downto 0));
end component ALu_Control;

component DataMemory is port ( clk : in STD_LOGIC;
adress : in STD_LOGIC_VECTOR (31 downto 0);
writedata : in STD_LOGIC_VECTOR (31 downto 0);
memwrite : in STD_LOGIC;
memread : in STD_LOGIC;
bytein : in STD_LOGIC;
readdata : out STD_LOGIC_VECTOR (31 downto 0));
end component DataMemory;

component ALU is port ( rd1 : in STD_LOGIC_VECTOR (31 downto 0);
in2 : in STD_LOGIC_VECTOR (31 downto 0);
alucontrol : in STD_LOGIC_VECTOR (2 downto 0);
aluresult : out STD_LOGIC_VECTOR (31 downto 0);
zeroflag : out STD_LOGIC);           
end component ALU;

component Control_Unit is port ( op : in STD_LOGIC_VECTOR (5 downto 0);
RegWrite : out STD_LOGIC;
AluSrc : out STD_LOGIC;
RegDst : out STD_LOGIC;
MemToReg : out STD_LOGIC;
MemRead : out STD_LOGIC;
MemWrite : out STD_LOGIC;
Branch : out STD_LOGIC;
ALUop : out STD_LOGIC_VECTOR (1 downto 0));
end component Control_Unit;

component SignExtend is port ( Inst16 : in STD_LOGIC_VECTOR (15 downto 0);
Inst32 : out STD_LOGIC_VECTOR (31 downto 0));
end component SignExtend;

component ALU_s is port ( 	pcout : in  STD_LOGIC_VECTOR (31 downto 0);
shiftleftout : in  STD_LOGIC_VECTOR (31 downto 0);
aluout : out  STD_LOGIC_VECTOR (31 downto 0));
end component ALU_S;

component Shift_Left_2 is port ( signout : in  STD_LOGIC_VECTOR (31 downto 0);
shiftout : out  STD_LOGIC_VECTOR (31 downto 0));
end component Shift_Left_2;

component Mux_5 is Port ( control5 : in  STD_LOGIC;
in1_5 : in  STD_LOGIC_VECTOR (4 downto 0);
in2_5 : in  STD_LOGIC_VECTOR (4 downto 0);
out_5 : out  STD_LOGIC_VECTOR (4 downto 0));
end component Mux_5;

component Mux_32 is port (control32 : in  STD_LOGIC;
in1_32 : in  STD_LOGIC_VECTOR (31 downto 0);
in2_32 : in  STD_LOGIC_VECTOR (31 downto 0);
Out_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component Mux_32;

component PC is port ( clk : in  STD_LOGIC;
reset : in  STD_LOGIC;
PCin : in  STD_LOGIC_VECTOR (31 downto 0);
PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end component PC;


signal pc_adress : std_logic_vector (31 downto 0) := x"00000000";
signal RegWrite, AluSrc, RegDst, MemToReg, MemRead, MemWrite, Branch : std_logic;
signal zero : std_logic;
signal branch_and_zero : std_logic;
signal ALUop : std_logic_vector (1 downto 0);
signal AluCtrl : std_logic_vector (2 downto 0);
signal instruction : std_logic_vector (31 downto 0);
signal  pc_adress_4, pc_adress_add, pc_adress_mux : std_logic_vector (31 downto 0);
signal rt_or_rd : std_logic_vector (0 to 4);
signal sign_extend_out : std_logic_vector (31 downto 0);
signal datamem_mux : std_logic_vector (31 downto 0);
signal readdata_1, readdata_2, alu_in_mux, alu_result : std_logic_vector (31 downto 0);
signal shiftleft : std_logic_vector (31 downto 0);
signal readdata_data : std_logic_vector (31 downto 0);


alias opcode : std_logic_vector(5 downto 0) is instruction(31 downto 26);
alias funct : std_logic_vector(5 downto 0) is instruction(5 downto 0);	
alias rs : std_logic_vector(4 downto 0) is instruction(25 downto 21);
alias rt : std_logic_vector(4 downto 0) is instruction(20 downto 16);
alias rd : std_logic_vector(4 downto 0) is instruction(15 downto 11);
alias shamt : std_logic_vector(4 downto 0) is instruction(10 downto 6);
alias immed : std_logic_vector(15 downto 0) is instruction(15 downto 0);
begin

RegisterMem : Register_Mem port map ( clk, rs , rt, rt_or_rd, RegWrite, datamem_mux, readdata_1, readdata_2 );
Instruction_File : InstructionFile port map ( pc_adress, instruction );
AluControl : ALu_Control port map ( funct, ALUop, Aluctrl);
ControlUnit : Control_Unit port map( opcode, RegWrite, AluSrc, RegDst, MemToReg, MemRead, MemWrite, Branch, Aluop);
Main_ALU : ALU port map ( readdata_1, alu_in_mux , AluCtrl, alu_result, zero); 
Data_Memory : DataMemory port map (clk, alu_result, readdata_2, MemWrite, MemRead, bytein, readdata_data);
Sign_Extend : SignExtend port map ( immed, sign_extend_out );
Alu_sum : Alu_s port map ( pc_adress , x"00000004", pc_adress_4 );
ALU_ADD : Alu_s port map ( pc_adress_4 , shiftleft, pc_adress_add);
Mux_32_1 : Mux_32 port map ( branch_and_zero, pc_adress_4, pc_adress_add, pc_adress_mux ); --Pc deðeri için mux
Mux_32_2 : Mux_32 port map ( MemToReg , alu_result, readdata_data, datamem_mux ); -- Register File'a girecek memory deðeri için mux
Mux_32_3 : Mux_32 port map ( AluSrc , readdata_2, readdata_1 , alu_in_mux); -- Alu'ya girecek deðer için mux
Mux5 : Mux_5 port map (RegDst, rt, rd, rt_or_rd ); --Register File'a girece instruction deðeri için mux
Shift : Shift_Left_2 port map ( sign_extend_out, shiftleft );
P_C : PC port map ( clk, reset , pc_adress_mux, pc_adress);
 
branch_and_zero <= branch and zero;



end Behavioral;
