LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY segment7_tb  IS 
END ;
 
ARCHITECTURE segment7_tb_arc OF segment7_tb IS

COMPONENT Part2 IS
PORT ( SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;


signal inmux : std_logic_vector(1 downto 0);
signal shiftin : std_logic_vector(2 downto 0);
signal out0, out1, out2, out3, out4 : std_logic_vector(6 downto 0);


Begin

DUT : Part2 port map(SW(1 downto 0) => inmux, SW(4 downto 2) => shiftin,
                    HEX0 => out0, HEX1 => out1, HEX2 => out2, HEX3 => out3, HEX4 => out4);

  Process
	Begin
	 inmux  <= "00" ;
         shiftin  <= "000";
        wait for 5 ms ;
	 shiftin  <= "001"  ;
	wait for 5 ms;
	 shiftin  <= "010"  ;
	wait for 5 ms ;
	 shiftin  <= "011"  ;
	wait for 5 ms ;
	 shiftin  <= "100"  ;
	
	wait for 5 ms;
	
        inmux  <= "01" ;
         shiftin  <= "000";
        wait for 5 ms ;
	 shiftin  <= "001"  ;
	wait for 5 ms ;
	 shiftin  <= "010"  ;
	wait for 5 ms ;
	 shiftin  <= "011"  ;
	wait for 5 ms ;
	 shiftin  <= "100"  ;

    wait for 5 ms;

        inmux  <= "10" ;
         shiftin  <= "000";
        wait for 5 ms ;
	 shiftin  <= "001"  ;
	wait for 5 ms ;
	 shiftin  <= "010"  ;
	wait for 5 ms ;
	 shiftin  <= "011"  ;
	wait for 5 ms ;
	 shiftin  <= "100"  ;
	wait for 5 ms ;

    wait for 5 ms;
	
        inmux  <= "11" ;
         shiftin  <= "000";
        wait for 5 ms ;
	 shiftin  <= "001"  ;
	wait for 5 ms ;
	 shiftin  <= "010"  ;
	wait for 5 ms ;
	 shiftin  <= "011"  ;
	wait for 5 ms ;
	 shiftin  <= "100"  ;
	wait;
 End Process;
END segment7_tb_arc;
