library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Register_Mem_tb is
end;

architecture bench of Register_Mem_tb is

  component Register_Mem
      Port ( clk : in  STD_LOGIC;
  read_reg_1 : in  STD_LOGIC_VECTOR (4 downto 0);           
  read_reg_2 : in  STD_LOGIC_VECTOR (4 downto 0);           
  write_reg : in  STD_LOGIC_VECTOR (4 downto 0);           
  signal_reg_write : in  STD_LOGIC;           
  write_data : in  STD_LOGIC_VECTOR (31 downto 0);           
  read_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);           
  read_data_2 : out  STD_LOGIC_VECTOR (31 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal read_reg_1: STD_LOGIC_VECTOR (4 downto 0);
  signal read_reg_2: STD_LOGIC_VECTOR (4 downto 0);
  signal write_reg: STD_LOGIC_VECTOR (4 downto 0);
  signal signal_reg_write: STD_LOGIC;
  signal write_data: STD_LOGIC_VECTOR (31 downto 0);
  signal read_data_1: STD_LOGIC_VECTOR (31 downto 0);
  signal read_data_2: STD_LOGIC_VECTOR (31 downto 0);

  constant clock_period: time := 300 ns;
  

begin

  uut: Register_Mem port map ( clk              => clk,
                               read_reg_1       => read_reg_1,
                               read_reg_2       => read_reg_2,
                               write_reg        => write_reg,
                               signal_reg_write => signal_reg_write,
                               write_data       => write_data,
                               read_data_1      => read_data_1,
                               read_data_2      => read_data_2 );


  process
  begin
  
  clk <= '1';
  wait for clock_period / 2;
  clk <= '0';
  wait for clock_period /2;
    
  end process;
  
   process
   begin
   
   signal_reg_write <= '1';
   read_reg_1 <= "00001";
   read_reg_2 <= "00011";
   write_reg <= "00111";
   write_data <= x"11111111";
   wait for 100ns;
   signal_reg_write <= '0';
   read_reg_1 <= "00001";
   read_reg_2 <= "01011";
   write_reg <= "01111";
   write_data <= x"22222222"; 
   wait for 100ns;
   read_reg_1 <= "00111";
   wait for 100ns;
   
  end process;


end;