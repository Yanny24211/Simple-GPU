library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use ieee.numeric_std.all; 
entity ALU_problem2 is 
port(Clk: in std_logic;
		A,B: in unsigned(7 downto 0);
		student_id: in unsigned(3 downto 0);
		OP: in unsigned(15 downto 0); 
		Neg: out std_logic; 
		R1: out unsigned(3 downto 0); 
		R2: out unsigned(3 downto 0)); 
end ALU_problem2; 
architecture calculation of ALU_problem2 is
	signal Reg1,Reg2,Result: unsigned(7 downto 0):=(others=>'0'); 
	signal Reg4: unsigned(0 to 7); 
	begin
	Reg1 <= A; --temporarily storing A into Reg1 
	Reg2 <= B; --temporarily storing B into Reg2
	process(Clk, OP)
	begin
		if(rising_edge(Clk))THEN
			case OP is
				WHEN "0000000000000001" => --1
					if(Reg2>Reg1) then 
						Result <= (Reg1 + (NOT Reg2 + 1)); 
						Neg<='1'; --sets neg to 1 
					else
						Result<=(Reg1-Reg2);
						Neg<='0';
					end if; 
					
				WHEN "0000000000000010" => --2
					Result <= (NOT Reg2 + 1); 
					Neg<='0';
					
				WHEN "0000000000000100" => --3
					Result<= Reg1;
					Result(0) <= Reg2(0);
					Result(1) <= Reg2(1);
					Result(2) <= Reg2(2);
					Result(3) <= Reg2(3);
					Neg<='0';
					
				WHEN "0000000000001000" => --4
					Result<= null; 
					Neg<='0';
					
				WHEN "0000000000010000" => --5
					if(5>Reg2) then 
						Result <= (Reg2 + 11111011); 
						Neg<='1'; --sets neg to 1 
					else
						Result<=(Reg2 - 5);
						Neg<='0';
					end if; 
					
				WHEN "0000000000100000" => --6 
					Result(0) <= Reg1(7);
					Result(1) <= Reg1(6);
					Result(2) <= Reg1(5);
					Result(3) <= Reg1(4);
					Result(4) <= Reg1(3);
					Result(5) <= Reg1(2);
					Result(6) <= Reg1(1);
					Result(7) <= Reg1(0);
					Neg<='0';
					
				WHEN "0000000001000000" => --7
					Result<= shift_left(unsigned(Reg2), 3);
					Result(0) <= '1'; 
					Result(1) <= '1'; 
					Result(2) <= '1'; 
					Result(3) <= '1'; 
					Result(4) <= '1'; 
					Neg<='0';
					
				WHEN "0000000010000000" => --8
					Result<= Reg1 + 3; 
					Neg<='0';
					
				WHEN "0000000100000000" => --9
					Result<= (NOT Reg2); 
					Neg<='0';
					
				WHEN OTHERS => Result<="--------"; --Does nothing since its dont care
			end case; 
		end if; 
	end process; 
	R1<= Result(3 downto 0); --splits 8-bit result into two 4-bit results
	R2<= Result(7 downto 4); 
end calculation; 
