LIBRARY ieee; 
use ieee.std_logic_1164.all; 

entity latch1 is
	port(X: in std_logic_vector(7 downto 0);--8 bit input
			Resetn, Clock: in std_logic; --1 bit reset, clock input
			q: out std_logic_vector(7 downto 0));  
end latch1; 
architecture behavior of latch1 is 
begin 
	process(Resetn, Clock)
	begin
		
		if Resetn = '0' then
			q<="00000000"; 
		elsif Clock'EVENT AND Clock='1' THEN
			q<=X; 
		end if; 
	end process; 
end behavior; 