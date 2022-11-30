library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use ieee.numeric_std.all; 
entity ALU is 
port(Clk: in std_logic;
		A,B: in unsigned(7 downto 0);
		student_id: in unsigned(3 downto 0);
		OP: in unsigned(15 downto 0); 
		Neg: out std_logic; 
		R1: out unsigned(3 downto 0); 
		R2: out unsigned(3 downto 0)); 
end ALU; 
architecture calculation of ALU is
	signal Reg1,Reg2,Result: unsigned(7 downto 0); --:=(others=>'0'); 
	signal Reg4: unsigned(0 to 7); 
	begin
	Reg1 <= A; --temporarily storing A into Reg1 
	Reg2 <= B; --temporarily storing B into Reg2
	process(Clk, OP)
	begin
		if(rising_edge(Clk))THEN
			case OP is
				WHEN "0000000000000001" => 
					Result<= (Reg1 + Reg2);
					
				WHEN "0000000000000010" =>
					if(Reg2>Reg1) then 
						Result <= (Reg1 + (NOT Reg2 + 1)); --does two's comp for Reg2
						Neg<='1'; --sets neg to 1 
					else
						Result<=(Reg1-Reg2);
						Neg<='0';
					end if; 
					
				WHEN "0000000000000100" =>
					Result<= NOT Reg1; --inversion
					Neg<='0';
					
				WHEN "0000000000001000" =>
					Result<= Reg1 NAND Reg2; --NAND
					Neg<='0';
					
				WHEN "0000000000010000" =>
					Result<= Reg1 NOR Reg2; --NOR
					Neg<='0';
					
				WHEN "0000000000100000" =>
					Result<= Reg1 AND Reg2; --AND
					Neg<='0';
					
				WHEN "0000000001000000" =>
					Result<= Reg1 OR Reg2; --OR
					Neg<='0';
					
				WHEN "0000000010000000" =>
					Result<= Reg1 XOR Reg2; --XOR
					Neg<='0';
					
				WHEN "0000000100000000" =>
					Result<= Reg1 XNOR Reg2; --XNOR
					Neg<='0';
					
				WHEN OTHERS => Result<="--------"; --Does nothing since its dont care
			end case; 
		end if; 
	end process; 
	R1<= Result(3 downto 0); --splits 8-bit result into two 4-bit results
	R2<= Result(7 downto 4); 
end calculation; 
