


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Shift_Left_2 is
    Port ( signout : in  STD_LOGIC_VECTOR (31 downto 0);
           shiftout : out  STD_LOGIC_VECTOR (31 downto 0));
end Shift_Left_2;

architecture Behavioral of Shift_Left_2 is

begin
	shiftout<=signout(29 downto 0)&"00"; --es una multiplicacion por 4
end Behavioral;