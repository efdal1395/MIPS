----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2018 19:08:18
-- Design Name: 
-- Module Name: AluControl_tb - Behavioral
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

entity AluControl_tb is
--  Port ( );
end AluControl_tb;



architecture Behavioral of AluControl_tb is
component Alu_control 

Port ( in_function : in STD_LOGIC_VECTOR (5 downto 0);
           AluOp : in STD_LOGIC_VECTOR (1 downto 0);
           AluControl : out STD_LOGIC_VECTOR (2 downto 0));
           
 end component;
 
 signal in_function: STD_LOGIC_VECTOR (5 downto 0);
 signal AluOp: STD_LOGIC_VECTOR (1 downto 0);
 signal AluControl: STD_LOGIC_VECTOR (2 downto 0);



begin

 uut: ALu_Control port map ( in_function => in_function,
                              AluOp       => AluOp,
                              AluControl  => AluControl );
                              
 process
 begin
 
 in_function <= "111111";
 AluOp <= "00";
 
 wait for 50ns;
 
 in_function <= "000000";
 AluOp <= "11";
 
 wait for 50ns;
 
 end process;
 
                           
end ;
