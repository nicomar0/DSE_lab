LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY part3 IS
PORT ( KEY : in std_logic_vector (0 downto 0);
SW : in std_logic_vector (1 downto 0);
LEDR : out std_logic_vector (0 downto 0));
END part3;

ARCHITECTURE Behavior OF part3 IS
SIGNAL w, rst, clk, z : std_logic;


TYPE State_type IS (A, B, C, D, E, F, G, H, I);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next
BEGIN


PROCESS (w, y_Q) -- state table
BEGIN
CASE y_Q IS
WHEN A => 
if(rst='1') then
	IF (w = '0') THEN 
	Y_D <= B;
	ELSE Y_D <= F;
	END IF;
else
Y_D<=A;
end if;

WHEN B => 
IF (w = '0') THEN 
Y_D <= C;
ELSE Y_D <= F;
END IF;

WHEN C => 
IF (w = '0') THEN 
Y_D <= D;
ELSE Y_D <= F;
END IF;

WHEN D => 
IF (w = '0') THEN 
Y_D <= E;
ELSE Y_D <= F;
END IF;

WHEN E => 
IF (w = '0') THEN 
Y_D <= E;
ELSE Y_D <= F;
END IF;

WHEN F => 
IF (w = '1') THEN
 Y_D <= G;
ELSE Y_D <= B;
END IF;

WHEN G => 
IF (w = '1') THEN
 Y_D <= H;
ELSE Y_D <= B;
END IF;

WHEN H => 
IF (w = '1') THEN
 Y_D <= I;
ELSE Y_D <= B;
END IF;

WHEN I => 
IF (w = '1') THEN
 Y_D <= I;
ELSE Y_D <= B;
END IF;

WHEN OTHERS =>
 Y_D <=A;
 
END CASE;

END PROCESS; -- state table



PROCESS (clk) -- state flip-flops
BEGIN
if (clk = '1' and clk' event) then
	if(rst='1') then
   Y_Q <= Y_D;  
	else
	Y_Q<=A; -- synchronous reset
	end if;
end if;
END PROCESS;

CC2 : process(Y_Q)
begin
	case(Y_Q) is
	when E=>
		z<='1';
	when I=>
		z<='1';
	when others=>
		z<='0';
	end case;
end process;


LEDR(0)<=z;
w<=SW(1);
rst<=SW(0);
clk<=KEY(0);


 END Behavior;









