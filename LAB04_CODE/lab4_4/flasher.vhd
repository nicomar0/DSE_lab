LIBRARY ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY flasher is
PORT ( CLOCK_50 : IN std_logic;
SW: IN std_logic_vector(0 downto 0);
KEY : IN std_logic_vector(0 downto 0); 
HEX0: OUT std_logic_vector(0 to 6));
END flasher;

Architecture flasher_arch of flasher is


component regn 
GENERIC ( N : integer:=4); 
PORT (R : IN UNSIGNED(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
Q : OUT UNSIGNED(N-1 DOWNTO 0));
END component;

component decoder7_hex
PORT (Cin : IN STD_LOGIC_VECTOR(3 downto 0);
segment7: OUT std_logic_vector(0 to 6));
end component;

component adder
PORT( A : IN unsigned(3 downto 0);
E: in unsigned(25 downto 0);
S: out unsigned (3 downto 0));
end component;

component counter
port( EN, CK, CLC : in std_logic;
Q : inout unsigned(25 downto 0));
end component;

signal S_out : unsigned (3 downto 0);
signal reg_in, reg_out : unsigned (3 downto 0);
signal counter_out : unsigned(25 downto 0);
signal reg_rst, register_rst_tot : std_logic;

begin
register_rst_tot <= reg_rst and KEY(0);

REg : regn PORT MAP (reg_in,CLOCK_50, register_rst_tot, reg_out);

dec7 : decoder7_hex PORT MAP (std_logic_vector(reg_out),HEX0);

add : adder PORT MAP (A=>reg_out, E=>counter_out,S=>S_out);

count : counter PORT MAP (SW(0), CLOCK_50,KEY(0),counter_out);

reg_in<=S_out;
check : process(reg_out) -- check if adder_out > 10, then register->reset
begin
if  (reg_out > 9) then
reg_rst <= '0';
else
reg_rst <= '1';
end if;
end process;

end flasher_arch;
