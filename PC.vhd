

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           PCin : in  STD_LOGIC_VECTOR (31 downto 0);
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is
	
begin
	process(clk,reset)
	begin
		if(reset='1') then
				PCout <= (others=>'0');
		elsif(clk'event and clk='1') then
			PCout<=PCin;
		end if;
	end process;

end Behavioral;