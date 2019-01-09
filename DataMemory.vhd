library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity DataMemory is
    Port ( clk : in STD_LOGIC;
           adress : in STD_LOGIC_VECTOR (31 downto 0);
           writedata : in STD_LOGIC_VECTOR (31 downto 0);
           memwrite : in STD_LOGIC;
           memread : in STD_LOGIC;
           bytein : in STD_LOGIC;
           readdata : out STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

type ram is array (0 to 255) of std_logic_vector (31 downto 0);
signal ram_s : ram := (others => (others => '0'));
signal readdata_s : std_logic_vector (31 downto 0);

begin

readdata <= readdata_s;

process (memread, adress)
begin


if (memread = '1') then
if (bytein = '1') then --lb

readdata_s(7 downto 0) <= ram_s(to_integer(unsigned(adress(7 downto 0))))(7 downto 0);
end if;

if (bytein = '0') then -- lw
readdata_s <= ram_s(to_integer(unsigned(adress(7 downto 0))));
end if;
else readdata_s <= x"00000000";
end if;
end process;

process (clk)
begin
if rising_edge(clk) then
if (memwrite = '1') then
if (bytein = '1') then --sb

ram_s(to_integer(unsigned(adress(7 downto 0))))(7 downto 0) <= writedata(7 downto 0);

end if;
if (bytein = '0') then --sw
ram_s(to_integer(unsigned(adress(7 downto 0)))) <= writedata;

end if;
end if;
end if;
end process;

end Behavioral;
