LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

entity comparator_8bit is
port( input1, input2 : in std_logic_vector(7 downto 0);
	  equal_check : out std_logic);
end comparator_8bit;

architecture behavior of comparator_8bit is
begin
process(input1, input2)
begin
	if(input1=input2) then
	equal_check<='1';
	else
	equal_check<='0';
	end if;
end process;

end behavior;