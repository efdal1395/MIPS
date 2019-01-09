library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Control_Unit_tb is
end;

architecture bench of Control_Unit_tb is

  component Control_Unit
      Port ( op : in STD_LOGIC_VECTOR (5 downto 0);
             RegWrite : out STD_LOGIC;
             AluSrc : out STD_LOGIC;
             RegDst : out STD_LOGIC;
             MemToReg : out STD_LOGIC;
             MemRead : out STD_LOGIC;
             MemWrite : out STD_LOGIC;
             Branch : out STD_LOGIC;
             ALUop : out STD_LOGIC_VECTOR (1 downto 0));
  end component;

  signal op: STD_LOGIC_VECTOR (5 downto 0);
  signal RegWrite: STD_LOGIC;
  signal AluSrc: STD_LOGIC;
  signal RegDst: STD_LOGIC;
  signal MemToReg: STD_LOGIC;
  signal MemRead: STD_LOGIC;
  signal MemWrite: STD_LOGIC;
  signal Branch: STD_LOGIC;
  signal ALUop: STD_LOGIC_VECTOR (1 downto 0);

begin

  uut: Control_Unit port map ( op       => op,
                               RegWrite => RegWrite,
                               AluSrc   => AluSrc,
                               RegDst   => RegDst,
                               MemToReg => MemToReg,
                               MemRead  => MemRead,
                               MemWrite => MemWrite,
                               Branch   => Branch,
                               ALUop    => ALUop );

  stimulus: process
  begin
  
  op <= (others => '0');
  wait for 50ns;  
  op <= (others => '1');
  wait for 50ns;  
  op <= "100011";  
  wait for 50ns;
  op <= "101011";
  wait for 50ns;
  op <= "000100";
  wait for 50ns;
  
    
  end process;


end;