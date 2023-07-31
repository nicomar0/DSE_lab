LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mux IS
PORT (inMUX0, inMUX1: IN STD_LOGIC;
s : IN std_logic;
z : OUT STD_LOGIC);
END mux;
ARCHITECTURE Behavior OF mux IS
BEGIN
z <= (NOT (s) AND inMUX0) OR (s AND inMUX1);
END Behavior;
