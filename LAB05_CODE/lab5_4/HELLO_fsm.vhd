LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY HELLO_fsm IS
PORT ( KEY : in std_logic_vector (0 downto 0);
CLOCK_50 : in std_logic;
HEX5,HEX4, HEX3, HEX2, HEX1, HEX0 : out STD_LOGIC_VECTOR(6 downto 0)
);

END HELLO_fsm;

ARCHITECTURE Behavior OF HELLO_fsm IS

SIGNAL TR, LD , rst: std_logic;
SIGNAL En : std_logic_vector (5 downto 0);

TYPE State_type IS (A, B, C, D, E, F, LP, Idle);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next

component datapath
port(
rst : in std_logic; -- controllare
clk, ld : in std_logic;
EN_reg : in std_logic_vector (5 downto 0);
HEXX0,HEXX1,HEXX2,HEXX3,HEXX4,HEXX5 : out std_logic_vector (0 to 6);
trig : out std_logic
);
end component;

BEGIN

rst <= KEY(0);
DP : datapath port map(KEY(0) ,CLOCK_50, LD, En , HEX0, HEX1, HEX2, HEX3, HEX4,HEX5, TR);

PROCESS (TR, y_Q) -- state table

BEGIN
CASE y_Q IS
WHEN A =>
if(rst='1') then
	IF (TR = '1') THEN
	Y_D <= B;
	else Y_D <=A;
	END IF;
else
Y_D<=A;
end if;

WHEN B =>
IF (TR = '1') THEN
Y_D <= C;
ELSE Y_D <= B;
END IF;

WHEN C =>
IF (TR = '1') THEN
Y_D <= D;
ELSE Y_D <= C;
END IF;

WHEN D =>
IF (TR = '1') THEN
Y_D <= E;
ELSE Y_D <= D;
END IF;

WHEN E =>
IF (TR = '1') THEN
Y_D <= F;
ELSE Y_D <= E;
END IF;

WHEN F =>
IF (TR = '1') THEN
 Y_D <= LP;
 ELSE Y_D <= F;
END IF;

WHEN LP =>
IF (TR = '0') THEN
 Y_D <= Idle;
ELSIF (TR = '1') THEN
Y_D <= LP;
END IF;

WHEN Idle=>
IF (TR = '1') THEN
 Y_D <= LP;
ELSE Y_D <= Idle;
END IF;

WHEN OTHERS =>
 Y_D <=A;

END CASE;

END PROCESS; -- state table



PROCESS (CLOCK_50) -- state flip-flops
BEGIN
if (CLOCK_50 = '1' and CLOCK_50' event) then
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
	
	when A=>
	En<= "000000";
	ld<='0';
	
	when B=>
		ld<='1';
    En<= "010000";

    when C=>
  		ld<='1';
      En<= "001000";

    when D=>
        ld<='1';
        En<= "000100";

        when E=>
          ld<='1';
          En<= "000010";

          when F=>
            ld<='1';
            En<= "000001";

            when LP=>
              ld<='0';
              En<= "111111";

              when OTHERS=>
                ld<='0';
                En<= "000000";

	end case;
end process;


 END Behavior;
