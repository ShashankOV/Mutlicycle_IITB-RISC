library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;
use std.textio.all ;
use IEEE.std_logic_textio.all; -- to compile add option --ieee=synopsys

entity test_DUT is
end test_DUT;

architecture testbench of test_DUT is
	signal A, B, Res : std_logic_vector(15 downto 0);
	signal S, C : std_logic;	
	
	component alu is
		generic(word_length: integer := 16);
		port(
			input1, input2: in std_logic_vector(word_length-1 downto 0);
			output: out std_logic_vector(word_length-1 downto 0);
			cin, sel: in std_logic;
			CY, Z: out std_logic);
	end component;

	function vec_to_str (x : std_logic_vector) return String is
		variable L : line ;
		variable W : String (1 to x'length) := (others =>' ');
	begin
		write(L,x);
		W(L.all'range) := L.all;
		Deallocate(L);
		return W ;
	end vec_to_str ;
begin
	process
	file f : text open read_mode is "outputs.txt" ;
	variable C_test : std_logic;
	variable S_test : std_logic_vector(0 downto 0);
	variable A_test : std_logic_vector(15 downto 0);
	variable B_test : std_logic_vector(15 downto 0);
	variable Res_test : std_logic_vector(15 downto 0); 
	variable L : line ;
	variable fail : integer := 0;
	begin
		while not endfile(f) loop
			readline(f,L);
			read(L,S_test);
			read(L,A_test);
			read(L,B_test);
			read(L,C_test);
			read(L,Res_test);
	
			S <= S_test(0);
			C <= C_test;
			A <= A_test;
			B <= B_test;
			wait for 1 ns;
			
			if not (Res = Res_test) then
			fail := fail + 1;
			report "Error in " & vec_to_str(S_test) &LF& 
				"A: " & vec_to_str(A) & " B: " & vec_to_str(B) &LF&
				"E: " & vec_to_str(Res_test) & " O: " & vec_to_str(Res);
			end if;
		end loop ;
		assert false report "Test completed. " & integer'image (fail) & " failures."
		severity note;
		wait ;
	end process ;
	dut : alu
	generic map(16)
	port map(sel => S,
			cin => C,
			input1 => A,
			input2 => B,
			output => Res);
end testbench;
