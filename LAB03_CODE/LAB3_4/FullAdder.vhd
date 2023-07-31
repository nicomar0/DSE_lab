LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fulladder is
PORT( a_FA, b_FA, c_in: in std_logic;
	  sum, c_out: out std_logic);
end fulladder;
architecture behavior of fulladder is
component mux	
	PORT (inMUX0, inMUX1: IN STD_LOGIC;
s : IN std_logic;
z : OUT STD_LOGIC);
END component;
signal outxor1 : std_logic;
begin
outxor1<= (a_FA and not(b_FA)) or (not(a_FA) and b_FA);
sum<=(c_in and not(outxor1)) or (not(c_in) and outxor1);
MULT: mux PORT map(b_FA,c_in, outxor1,c_out);
end behavior;

