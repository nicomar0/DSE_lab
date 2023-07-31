LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 

ENTITY segment7_tb  IS 
END ; 
 
ARCHITECTURE segment7_tb_arc OF segment7_tb IS

  COMPONENT part1  
    PORT ( 
      SW : in std_logic_vector (2 downto 0) ; 
      HEX0  : out std_logic_vector (0 to 6) ); 
  END COMPONENT ;

  SIGNAL input   :  std_logic_vector (2 downto 0)  ; 
  SIGNAL output  :  std_logic_vector (0 to 6)  ; 
BEGIN 
     DUT : part1 PORT MAP (  SW => input,
         HEX0 => output); 

  Process
	Begin
	 input  <= "000"  ;
	wait for 1 ms ;
	 input  <= "001"  ;
	wait for 1 ms ;
	 input  <= "010"  ;
	wait for 1 ms ;
	 input  <= "011"  ;
	wait for 1 ms ;
	 input  <= "100"  ;
	wait for 1 ms ;
	 input  <= "101"  ;
	wait for 1 ms ;
	 input  <= "110"  ;
	wait for 1 ms ;
	 input  <= "111"  ;
wait for 1 ms;
	wait;
 End Process;
END;

