----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.12.2018 21:11:43
-- Design Name: 
-- Module Name: SignExtend - Behavioral
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
use IEEE.numeric_std.all;

entity SignExtend is
    Port ( Inst16 : in STD_LOGIC_VECTOR (15 downto 0);
           Inst32 : out STD_LOGIC_VECTOR (31 downto 0));
end SignExtend;

architecture Behavioral of SignExtend is


begin
Inst32 <= std_logic_vector(resize(signed(inst16), inst32'length));

end Behavioral;
