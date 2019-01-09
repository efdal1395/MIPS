library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity InstructionFile is
    Port ( readadress : in STD_LOGIC_VECTOR (31 downto 0);
           instruction : out STD_LOGIC_VECTOR (31 downto 0));
end InstructionFile;

architecture Behavioral of InstructionFile is
type ins_mem is array (0 to 15) of std_logic_vector(31 downto 0);

signal ins_mem_s : ins_mem := ( 
"00000010000100011001000000100000",
"00001000000000000000000000000101",
"00000010000100011001000000100100",
"00000010000100011001000000100101",
"00000010000100011001000000100010",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000",
   x"00000000" ) ;
   
begin

instruction <= ins_mem_s(to_integer(unsigned(readadress(3 downto 0))));

end Behavioral;
