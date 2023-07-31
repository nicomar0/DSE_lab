LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fsm_wrapper is
port(SW : in std_logic_vector(1 downto 0);
     KEY : in std_logic_vector (0 downto 0);
	 LEDR : out std_logic_vector(0 downto 0));
end fsm_wrapper;

architecture fsm_wrapper_arc of fsm_wrapper is

--signal not_RST : std_logic;

component fsm
port(RST : in std_logic;
     CLK : in std_logic;
     w : in std_logic;
	 z : out std_logic);
end component; 


begin

--not_RST <= not(SW(0));

FSM0 : fsm port map(SW(0), KEY(0), SW(1), LEDR(0));

end fsm_wrapper_arc;