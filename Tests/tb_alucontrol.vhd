library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ALU_tb is
end;

architecture bench of ALU_tb is

  component ALU
      Port ( rd1 : in STD_LOGIC_VECTOR (31 downto 0);
             in2 : in STD_LOGIC_VECTOR (31 downto 0);
             alucontrol : in STD_LOGIC_VECTOR (2 downto 0);
             aluresult : out STD_LOGIC_VECTOR (31 downto 0);
             zeroflag : out STD_LOGIC);
  end component;

  signal rd1: STD_LOGIC_VECTOR (31 downto 0);
  signal in2: STD_LOGIC_VECTOR (31 downto 0);
  signal alucontrol: STD_LOGIC_VECTOR (2 downto 0);
  signal aluresult: STD_LOGIC_VECTOR (31 downto 0);
  signal zeroflag: STD_LOGIC;

begin

  uut: ALU port map ( rd1        => rd1,
                      in2        => in2,
                      alucontrol => alucontrol,
                      aluresult  => aluresult,
                      zeroflag   => zeroflag );

  process
  begin

  -- and
  rd1 <= x"00000000";
  in2 <= x"00000000";
  alucontrol <= "000";
  wait for 50ns;
  rd1 <= x"11111111";
  in2 <= x"00000000";
  alucontrol <= "000";
  wait for 50ns;
  rd1 <= x"11111111";
  in2 <= x"11111111";
  alucontrol <= "000";
  wait for 50ns;
  
  --or
  
   rd1 <= x"00000000";
   in2 <= x"00000000";
   alucontrol <= "001";
   wait for 50ns;
   rd1 <= x"11111111";
   in2 <= x"00000000";
   alucontrol <= "001";
   wait for 50ns;
   rd1 <= x"11111111";
   in2 <= x"11111111";
   alucontrol <= "001";
   wait for 50ns;
   
   --add
    rd1 <= x"00000000";
    in2 <= x"00000000";
    alucontrol <= "010";
    wait for 50ns;
    rd1 <= x"11111111";
    in2 <= x"00000000";
    alucontrol <= "010";
    wait for 50ns;
    rd1 <= x"00000111";
    in2 <= x"00000011";
    alucontrol <= "010";
    wait for 50ns;
    
    --substract
    
     rd1 <= x"00000000";
     in2 <= x"00000000";
     alucontrol <= "110";
     wait for 50ns;
     rd1 <= x"11111111";
     in2 <= x"00000000";
     alucontrol <= "110";
     wait for 50ns;
     rd1 <= x"11111111";
     in2 <= x"11111111";
     alucontrol <= "110";
     wait for 50ns;
     
     -- set on less than
     
      rd1 <= x"00000000";
      in2 <= x"00000000";
      alucontrol <= "111";
      wait for 50ns;
      rd1 <= x"11111111";
      in2 <= x"00000000";
      alucontrol <= "111";
      wait for 50ns;
      rd1 <= x"11111111";
      in2 <= x"11111111";
      alucontrol <= "111";
      wait for 50ns;
      rd1 <= x"00000111";
      in2 <= x"11111111";
      alucontrol <= "111";
      wait for 50ns;


  end process;


end;