LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY fullmux is
	PORT(SW : IN STD_LOGIC_VECTOR(8 downto 0);
	LEDR: OUT STD_logic_vector (2 downto 0));
END fullmux;

architecture structural of fullmux is
COMPONENT threebitmux
PORT (inmux :IN std_logic_vector(6 downto 0); outmux: OUT std_logic_vector(2 downto 0));
END COMPONENT;

SIGNAL U, V, W, X,Y, S: STD_logic_vector(2 downto 0);
SIGNAL OUT0, OUT1, OUT2, OUT3: STD_logic_vector(2 downto 0);
BEGIN
S<=SW(8 downto 6);
X<=SW(5 downto 3);
Y<=SW(2 downto 0);
U<="101";
V<="010";
W<="111";
	M0 : threebitmux PORT MAP (inmux(2 downto 0)=>U, inmux(5 downto 3)=>V, inmux(6)=>S(0), outmux=>OUT0);
	M1 : threebitmux PORT MAP (inmux(2 downto 0)=>W, inmux(5 downto 3)=>X, inmux(6)=>S(0), outmux=>OUT1);
	M2 : threebitmux PORT MAP (inmux(2 downto 0)=>OUT0, inmux(5 downto 3)=>OUT1, inmux(6)=>S(1), outmux=>OUT2);
	M3 : threebitmux PORT MAP (inmux(2 downto 0)=>OUT2, inmux(5 downto 3)=>Y, inmux(6)=>S(2), outmux=>OUT3);
	LEDR<=OUT3;

END structural;