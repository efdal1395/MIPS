----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.01.2019 12:01:14
-- Design Name: 
-- Module Name: Mux_5 - Behavioral
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

entity Mux_5 is
    Port ( control5 : in  STD_LOGIC;
           in1_5 : in  STD_LOGIC_VECTOR (4 downto 0);
           in2_5 : in  STD_LOGIC_VECTOR (4 downto 0);
           out_5 : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux_5;

architecture Behavioral of Mux_5 is

begin
	out_5 <= 	in1_5 	when control5='0' else in2_5;

end Behavioral;