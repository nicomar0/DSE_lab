LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- "Empty" entity. 
ENTITY testbench_es1 IS
END testbench_es1;
 
ARCHITECTURE Behavior OF testbench_es1 IS 
-- DEVICE UNDER TEST 
COMPONENT fourbitmux is
PORT (SW: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
 LEDR: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)); 
END COMPONENT; 
-- TESTBENCH SIGNALS (WRAPPING UP THE DUT) 
 
SIGNAL LEDR0, X,Y: STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL S: STD_LOGIC;
SIGNAL INPUTS: STD_LOGIC_VECTOR(8 DOWNTO 0);

BEGIN 

PROCESS
BEGIN 
 X <= "0110"; 
 Y <= "1001";
 S <= '0'; 
 WAIT FOR 20 ps; 
 S <= '1'; 
 WAIT FOR 20 ps; 
 X <= "1111"; 
 Y <= "1010";	
 S<='0';
 WAIT FOR 20 ps; 
 S <= '1'; 
 WAIT FOR 20 ps;
 X <= "0011"; 
 Y <= "1110";
 S <= '0'; 
 WAIT FOR 20 ps; 
 S <= '1'; 
 WAIT FOR 20 ps;
Wait;
END PROCESS; 
 
-- This is to align the inputs S...V in the form allowed by the component.
INPUTS <= S&Y&X; 
 
-- DEVICE UNDER TEST. 
MUX_UT: fourbitmux PORT MAP (INPUTS, LEDR0);
--------------------- 
-- M is the output of the circuit.
 
END Behavior;
