LIBRARY ieee; 
use ieee.std_logic_1164.all; 

entity latch2 is
	port(B: in std_logic_vector(7 downto 0)
			Resetn, Clock: in std_logic; 
			q: out std_logic_vector(7 downto 0)); 
end lacth2; 
architecture behavior of latch2 is 
begin 
	process(Resetn, Clock)
	begin
		if Resetn = '0' then
			q<="0000000"; 
		elsif Clock'EVENT AND Clock='1' THEN
			q<=B; 
		end if; 
	end process; 
end behavior; 