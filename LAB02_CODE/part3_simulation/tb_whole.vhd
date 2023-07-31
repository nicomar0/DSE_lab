LIBRARY ieee; 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY tb_whole IS
END tb_whole;
ARCHITECTURE circuit_tb_arc OF tb_whole IS

component display_connection
port(
SIGNAL SW : IN std_logic_vector(3 downto 0);
SIGNAL HEX1: OUT std_logic_vector(6 downto 0); 
SIGNAL HEX0: OUT std_logic_vector(6 downto 0));
END component;
SIGNAL input   :  std_logic_vector (3 downto 0)  ; 
SIGNAL HEXX0, HEXX1 : std_logic_vector(6 downto 0);

BEGIN 
   DUT :  display_connection PORT MAP (SW=>input, HEX0=>HEXX0, HEX1=>HEXX1); 

  Process
	Begin
	 input  <= "0000"  ;
	wait for 1 ms ;
	 input  <= "0001"  ;
	wait for 1 ms ;
	 input  <= "0010"  ;
	wait for 1 ms ;
	 input  <= "0011"  ;
    wait for 1 ms ;
	 input  <= "0100"  ;
	wait for 1 ms ;
	 input  <= "0101"  ;
	wait for 1 ms ;
	 input  <= "0110"  ;
	wait for 1 ms ;
	 input  <= "0111"  ;
	
	wait for 1 ms;
	input  <= "1000"  ;
	wait for 1 ms ;
	 input  <= "1001"  ;
	wait for 1 ms ;
	 input  <= "1010"  ;
	wait for 1 ms ;
	 input  <= "1011"  ;
	wait for 1 ms ;
	 input  <= "1100"  ;
	wait for 1 ms ;
	 input  <= "1101"  ;
	wait for 1 ms ;
	 input  <= "1110"  ;
	wait for 1 ms ;
	 input  <= "1111"  ;
	wait for 1 ms;
	wait;
 End Process;
END circuit_tb_arc;
