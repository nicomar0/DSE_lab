LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY regn IS
GENERIC ( N : integer := 3);
PORT (R : IN std_logic_vector(N-1 DOWNTO 0);
Clock, Resetn, EN : IN STD_LOGIC;
Q : OUT std_logic_vector(N-1 DOWNTO 0));
END regn;
ARCHITECTURE Behavior OF regn IS
BEGIN
PROCESS (Clock, Resetn)
BEGIN
IF (Resetn = '0') THEN
Q <= (OTHERS => '0');
ELSIF (Clock'EVENT AND Clock = '1' AND EN = '1') THEN
Q <= R;
END IF;
END PROCESS;
END Behavior;
