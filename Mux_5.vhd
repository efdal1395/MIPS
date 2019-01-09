


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



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
