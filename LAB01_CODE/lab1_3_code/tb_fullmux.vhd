LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- "Empty" entity. 
ENTITY testbench_es1 IS
END testbench_es1;
 
ARCHITECTURE Behavior OF testbench_es1 IS 
-- DEVICE UNDER TEST 
COMPONENT fullmux 
PORT (SW: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
 LEDR: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)); 
END COMPONENT; 
-- TESTBENCH SIGNALS (WRAPPING UP THE DUT) 
 
SIGNAL X, Y, M: STD_LOGIC_VECTOR(2 DOWNTO 0); 
SIGNAL S: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL INPUTS: STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN 
 
-- These signals emulate 
-- the switches SW5-0.
-- In this example they are FIXED. 
X <= "011"; 
Y <= "100";
-- This emulates selection signals
-- s0, s1 and s2. 
-- Control signals are dynamically changed every 20 ns.
-- This PROCESS is kind of a "clock":
-- After the last "WAIT FOR" it loops at the beginning.
-- The instruction WAIT FOR <time> IS 
-- ABSOLUTELY NOT SYNTHESIZABLE AND HAS NO 
-- PHYSICAL COUNTERPART. 
-- IT IS NOT A FLIP-FLOP OR A LOGIC ELEMENT!
PROCESS
BEGIN 
 S <= "000"; 
 WAIT FOR 20 ns; 
 S <= "001";
 WAIT FOR 20 ns; 
 S <= "010"; 
 WAIT FOR 20 ns; 
 S <= "011";
 WAIT FOR 20 ns; 
 S <= "100"; 
WAIT FOR 20 ns;
 WAIT; 
END PROCESS; 
 
-- This is to align the inputs S...V in the form allowed by the component.
INPUTS <= S & X & Y; 
 
-- DEVICE UNDER TEST. 
MUX_UT: fullmux PORT MAP (INPUTS, M);
--------------------- 
-- M is the output of the circuit.
 
END Behavior;