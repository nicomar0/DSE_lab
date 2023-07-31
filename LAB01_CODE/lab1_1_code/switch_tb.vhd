LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY switch_tb  IS 
END ; 
 
ARCHITECTURE switch_tb_arch OF switch_tb IS
  SIGNAL SW   :  std_logic_vector (9 downto 0)  ; 
  SIGNAL LEDR   :  std_logic_vector (9 downto 0)  ; 
  COMPONENT part1  
    PORT ( 
      SW  : in std_logic_vector (9 downto 0) ; 
      LEDR  : out std_logic_vector (9 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : part1  
    PORT MAP ( 
      SW   => SW  ,
      LEDR   => LEDR   ) ; 

  Process
	Begin
	 SW  <= "0000000001"  ;
	wait for 50 ps ;
	 SW  <= "0000000010"  ;
	wait for 50 ps ;
	 SW  <= "0000000100"  ;
	wait for 50 ps ;
	 SW  <= "0000001000"  ;
	wait for 50 ps ;
	 SW  <= "0000010000"  ;
	wait for 50 ps ;
	 SW  <= "0000100000"  ;
	wait for 50 ps ;
	 SW  <= "0001000000"  ;
	wait for 50 ps ;
	 SW  <= "0010000000"  ;
	wait for 50 ps ;
	 SW  <= "0100000000"  ;
	wait for 50 ps ;
	 SW  <= "1000000000"  ;
	wait for 50 ps ;

	wait;
 End Process;
END;
