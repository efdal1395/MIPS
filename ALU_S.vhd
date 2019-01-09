

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU_S is
    Port ( 
				pcout : in  STD_LOGIC_VECTOR (31 downto 0);
				shiftleftout : in  STD_LOGIC_VECTOR (31 downto 0);
				aluout : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_S;

architecture Behavioral of ALU_S is

begin
	
	aluout<=pcout+shiftleftout;
	
end Behavioral;
