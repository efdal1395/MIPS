library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Mips_tb is
end;

architecture bench of Mips_tb is

  component Mips
   port ( clk, bytein, reset : in std_logic);
  end component;

  signal clk, bytein, reset: std_logic;
  constant clk_p : time := 150 ns;
begin

  uut: Mips port map ( clk    => clk,
                       bytein => bytein,
                       reset  => reset );
  
  stimulus: process
  begin
reset <= '1';
        wait for 50ns;
    reset <= '0';
            wait; 
end process;

stimulus1 : process
begin
wait for 50ns;
clk <= '1'; wait for clk_p/2;
clk <= '0' ; wait for clk_p/2;
end process;
  

   


end;