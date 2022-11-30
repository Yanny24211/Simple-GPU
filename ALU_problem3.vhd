library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use ieee.numeric_std.all; 
entity ALU_problem3 is 
port(Clk: in std_logic;
		A,B: in unsigned(7 downto 0);
		student_id: in unsigned(3 downto 0);
		OP: in unsigned(15 downto 0); 
		R1: out unsigned(3 downto 0)); 
end ALU_problem3; 
architecture calculation of ALU_problem3 is
	signal Reg1,Reg2: unsigned(7 downto 0):=(others=>'0'); 
	signal Reg4,Result: unsigned(3 downto 0):=(others=>'0'); --initializes the variables and sets them to 0
	begin
	Reg1 <= A; --temporarily storing A into Reg1 
	Reg2 <= B; --temporarily storing B into Reg2
	Reg4 <= student_id; --temporarily storing student_id into Reg4
	process(Clk, OP)
	begin
		if(rising_edge(Clk))THEN
			case OP is
				WHEN "0000000000000001" => 
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000000000010" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000000000100" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000000001000" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000000010000" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000000100000" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000001000000" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000010000000" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN "0000000100000000" =>
					if (Reg4 = "0000") then
						Result <= "0001"; --no
					elsif ((Reg4(0) xor Reg4(1) xor Reg4(2) xor Reg4(3)) = '0') then
						Result <= "0000"; --yes
					else
						Result <= "0001"; --no
					end if; 
				WHEN OTHERS => Result<="----"; --Does nothing since its dont care
			end case; 
		end if; 
	end process; 
	R1<= Result(3 downto 0); --splits 8-bit result into two 4-bit results
end calculation; 
