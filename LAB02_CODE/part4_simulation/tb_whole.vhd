
LIBRARY ieee; 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY tb_whole IS
END tb_whole;
ARCHITECTURE circuit_tb_arc OF tb_whole IS

component display_connection
port(
SIGNAL SW : IN std_logic_vector(5 downto 0);
SIGNAL HEX1: OUT std_logic_vector(6 downto 0); 
SIGNAL HEX0: OUT std_logic_vector(6 downto 0));
END component;
SIGNAL input   :  std_logic_vector (5 downto 0)  ; 
SIGNAL HEXX0, HEXX1 : std_logic_vector(6 downto 0);

BEGIN 
     DUT : display_connection PORT MAP (SW=>input, HEX0=>HEXX0, HEX1=>HEXX1); 

  Process
	Begin
	 input  <= "000000"  ;
	wait for 50 ps ;
	 input  <= "000001"  ;
	wait for 50 ps ;
	 input  <= "000010"  ;
	wait for 50 ps ;
	 input  <= "000011"  ;
	wait for 50 ps ;
	 input  <= "000100"  ;
	wait for 50 ps ;
	 input  <= "000101"  ;
	wait for 50 ps ;
	 input  <= "000110"  ;
	wait for 50 ps ;
	 input  <= "000111"  ;
	wait for 50 ps;
	input  <= "001000"  ;
	wait for 50 ps ;
	 input  <= "001001"  ;
	wait for 50 ps ;
	 input  <= "001010"  ;
	wait for 50 ps ;
	 input  <= "001101"  ; --13
	wait for 50 ps ;
	 input  <= "010100"  ; --20
	wait for 50 ps ;
	 input  <= "011001"  ; --25
	wait for 50 ps ;
	 input  <= "100101"  ; --37
	wait for 50 ps ;
	 input  <= "101010"  ; --42
	wait for 50 ps ;
	 input  <= "110101"  ; --53
	wait for 50 ps ;
	 input  <= "111100"  ; --60
	wait for 50 ps ;
	 input  <= "111111"  ; --63
	wait for 50 ps;
	wait;

 End Process;
END circuit_tb_arc;
