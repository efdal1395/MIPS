
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Control_Unit is
    Port ( op : in STD_LOGIC_VECTOR (5 downto 0);
           RegWrite : out STD_LOGIC;
           AluSrc : out STD_LOGIC;
           RegDst : out STD_LOGIC;
           MemToReg : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           Branch : out STD_LOGIC;
           ALUop : out STD_LOGIC_VECTOR (1 downto 0));
end Control_Unit;

architecture Behavioral of Control_Unit is

signal R_type, lw, sw, beq, opnot0, opnot1, opnot2, opnot3, opnot4, opnot5 : std_logic;


begin
opnot0 <= not op(0);
opnot1 <= not op(1);
opnot2 <= not op(2);
opnot3 <= not op(3);
opnot4 <= not op(4);
opnot5 <= not op(5);

R_type <= (opnot0 and opnot1 and opnot2 and opnot3 and opnot4 and opnot5);
lw <= (op(5) and opnot4 and opnot3 and opnot2 and op(1) and op(0));
sw <= (op(5) and opnot4 and op(3) and opnot2 and op(1) and op(0));
beq <= (op(2) and opnot5 and opnot4 and opnot3 and opnot1 and opnot0);

RegWrite <= R_type or lw;
AluSrc <= lw or sw;
RegDst <= R_type;
MemToReg <=  lw;
MemRead <= lw;
MemWrite <= sw;
Branch <= beq;
AluOp(0) <= beq;
AluOp(1) <= R_type;



end Behavioral;
