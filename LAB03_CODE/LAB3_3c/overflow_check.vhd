LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.numeric_std.all;
entity overflow_check is
PORT( MSB_sum, sA,sB: in std_logic; --signs of inputs and output signed numbers
	  overfl : out std_logic);
end overflow_check;

architecture behavior of overflow_check is
begin
overfl<=((MSB_sum and (not(sA) and not(sB))) or ((not(MSB_sum) and (sA and sB))));
end behavior;