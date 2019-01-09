----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2018 19:00:33
-- Design Name: 
-- Module Name: ALu_Control - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALu_Control is
    Port ( in_function : in STD_LOGIC_VECTOR (5 downto 0);
           AluOp : in STD_LOGIC_VECTOR (1 downto 0);
           AluControl : out STD_LOGIC_VECTOR (2 downto 0));
end ALu_Control;

architecture Behavioral of ALu_Control is

begin

AluControl(2) <= (Aluop(0) or (Aluop(1) and in_function(1)));
AluControl(1) <= (not Aluop(1) or (not in_function(2)));
AluControl(0) <= ((in_function(3) or in_function(0)) and AluOp(1));
end Behavioral;
