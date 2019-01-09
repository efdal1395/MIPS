----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.01.2019 13:24:56
-- Design Name: 
-- Module Name: ALU_S - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
