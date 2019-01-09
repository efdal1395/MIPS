library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
USE std.textio.all;  

entity InstructionFile_tb is
end;

architecture bench of InstructionFile_tb is

  component InstructionFile
      Port ( readadress : in STD_LOGIC_VECTOR (31 downto 0);
             instruction : out STD_LOGIC_VECTOR (31 downto 0));
  end component;

  signal readadress: STD_LOGIC_VECTOR (31 downto 0);
  signal instruction: STD_LOGIC_VECTOR (31 downto 0);

begin
  
  uut: InstructionFile port map ( readadress  => readadress,
                                  instruction => instruction );

  process
  begin
  readadress <= x"00000001";
  wait for 50ns;
  readadress <= "11111111111111111111111111110011";
  wait for 50ns;

   
  end process;


end;