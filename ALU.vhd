library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU is
    Port ( rd1 : in STD_LOGIC_VECTOR (31 downto 0);
           in2 : in STD_LOGIC_VECTOR (31 downto 0);
           alucontrol : in STD_LOGIC_VECTOR (2 downto 0);
           aluresult : out STD_LOGIC_VECTOR (31 downto 0);
           zeroflag : out STD_LOGIC);
           end ALU;

architecture Behavioral of ALU is
signal saluresult,slt:STD_LOGIC_VECTOR (31 downto 0);
signal sign:std_logic;
begin

with alucontrol select saluresult<=       (rd1 and in2) when "000",
										  (rd1 or in2) when "001",
										  (rd1 + in2) when "010",
										   rd1 - in2 when "110",
										   slt when "111",
										   x"00000000" when others;
										   										  
with saluresult select zeroflag<= '1' when x"00000000",
								  '0' when others;

aluresult<=saluresult;
sign<=(rd1(31) and (not in2(31)));
process(rd1,in2,alucontrol)
begin
	if(sign='1')then
		slt<=x"00000001";
	elsif(rd1<in2)then
		slt<=x"00000001";
	else
		slt<=x"00000000";
	end if;
end process;

end Behavioral;
