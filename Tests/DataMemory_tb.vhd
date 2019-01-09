library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity DataMemory_tb is
end;

architecture bench of DataMemory_tb is

  component DataMemory
      Port ( clk : in STD_LOGIC;
             adress : in STD_LOGIC_VECTOR (31 downto 0);
             writedata : in STD_LOGIC_VECTOR (31 downto 0);
             memwrite : in STD_LOGIC;
             memread : in STD_LOGIC;
             bytein : in STD_LOGIC;
             readdata : out STD_LOGIC_VECTOR (31 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal adress: STD_LOGIC_VECTOR (31 downto 0);
  signal writedata: STD_LOGIC_VECTOR (31 downto 0);
  signal memwrite: STD_LOGIC;
  signal memread: STD_LOGIC;
  signal bytein: STD_LOGIC;
  signal readdata: STD_LOGIC_VECTOR (31 downto 0);

  constant clock_period: time := 10 ns;
  

begin

  uut: DataMemory port map ( clk       => clk,
                             adress    => adress,
                             writedata => writedata,
                             memwrite  => memwrite,
                             memread   => memread,
                             bytein    => bytein,
                             readdata  => readdata );

  stimulus: process
  begin
  bytein <= '0';
  memwrite <='1';
  memread <= '0';
  adress <= x"00000001";
  writedata <=x"FFFFFFF0";
  
  wait for 50ns;
  
  bytein <= '0';
  memwrite <='0';
  memread <= '1';
  adress <= x"00000001";
  
  wait for 50ns;
  
  bytein <= '0';
  memwrite <='1';
  memread <= '0';
  adress <= x"000000aa";
  writedata <=x"11111111";
    
   wait for 50ns;
  bytein <= '0';
  memwrite <='0';
  memread <= '1';
  adress <= x"000000AA";
  
  wait for 50ns;
  
  bytein <= '0';
  memwrite <='0';
  memread <= '1';
  adress <= x"00000002";
    
  wait for 50ns;
  bytein <= '1';
  memwrite <='0';
  memread <= '1';
  adress <= x"00000001";
  
  wait for 50ns;
  
  
  
    
  end process;

  clocking: process
  begin
  
      clk <= '1';
      wait for clock_period/2;
      clk <= '0';
      wait for clock_period/2;
      
  end process;

end;