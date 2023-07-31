LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fulladder is
PORT( a, b, cin: in std_logic;
	  sum, cout: out std_logic);
end fulladder;
architecture behavior of fulladder is
component mux	
	PORT (inMUX0, inMUX1: IN STD_LOGIC;
s : IN std_logic;
z : OUT STD_LOGIC);
END component;
signal outxor1 : std_logic;
begin
outxor1<= (a and not(b)) or (not(a) and b);
sum<=(cin and not(outxor1)) or (not(cin) and outxor1);
MULT: mux PORT map(b,cin, outxor1,cout);
end behavior;

