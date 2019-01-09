library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_Mem is
    Port ( clk : in  STD_LOGIC;
read_reg_1 : in  STD_LOGIC_VECTOR (4 downto 0);           
read_reg_2 : in  STD_LOGIC_VECTOR (4 downto 0);           
write_reg : in  STD_LOGIC_VECTOR (4 downto 0);           
signal_reg_write : in  STD_LOGIC;           
write_data : in  STD_LOGIC_VECTOR (31 downto 0);           
read_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);           
read_data_2 : out  STD_LOGIC_VECTOR (31 downto 0));

end Register_Mem;


architecture Behavioral of Register_Mem is

type reg_type is array(0 to 31) of std_logic_vector(31 downto 0);

signal reg: reg_type:=(
0 => x"FF000000",
1 => x"00001111",
2 => x"00001111",
3 => x"11111311",
4 => x"00000000",
5 => x"00000800",
6 => x"00000A00",
7 => x"00030000",
8 => x"00004000",
9 => x"00030000",
10 => x"11111111",
11 => x"00000000",
12 => x"00000000",
13 => x"00000000",
14 => x"00000000",
15 => x"00000000", 
16 => x"0000000F",
17 => x"00000A00",
18 => x"00000F00",
19 => "00000000000000000000000000000001",
20 => "00000000000000000000000000000011",
21 => "00000000000000000000000000000111",
22 => "00000000000000000000000000001111",
23 => "00000000000000000000000000011111", 
24 => "00000000000000000000000000111111",
25 => "00000000000000000000000000000000",
26 => "00000000000000000000000000000000",
27 => "00000000000000000000000000000000",  
28 => "00000000000000000000000000000000",
29 => "00000000000000000000000000000000",
30 => "00000000000000000000000000000000",
31 => "00000000000000000000000000000000");

begin


read_data_1<=reg(to_integer(unsigned(read_reg_1(4 downto 0))));
read_data_2<=reg(to_integer(unsigned(read_reg_2(4 downto 0))));

process(clk)

begin
		
if rising_edge(clk) then
if (signal_reg_write='1')then
reg(to_integer(unsigned(write_reg(4 downto 0))))<=write_data;
	
end if;

end if;
end process;


end Behavioral;