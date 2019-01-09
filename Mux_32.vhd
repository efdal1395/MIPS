
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_32 is
    Port ( control32 : in  STD_LOGIC;
           in1_32 : in  STD_LOGIC_VECTOR (31 downto 0);
           in2_32 : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_32;

architecture Behavioral of Mux_32 is

begin
	out_32 <= in1_32 when control32='0' else in2_32;
			
end Behavioral;