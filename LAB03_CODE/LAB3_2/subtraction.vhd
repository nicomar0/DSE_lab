LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity subtractor is
PORT ( S : in std_logic;
B_sub_in : in signed (3 downto 0); 
B_sub_out : out signed(3 downto 0));

end subtractor;

architecture sub_arch of subtractor is
begin
	process(S,B_sub_in)
	begin


	if (S = '0') then
	
	B_sub_out <= B_sub_in;

	else

	B_sub_out <= -B_sub_in;

end if;
end process;
end sub_arch;

