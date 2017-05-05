library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;
use std.textio.all ;
use IEEE.std_logic_textio.all; -- to compile add option --ieee=synopsys
use ieee.math_real.all;

entity testbench1 is
end testbench1;

architecture test of testbench1 is
	component register_file is
	generic(
		word_length: integer := 16;
		num_words: integer := 8);
		
	port(
		input: in std_logic_vector(15 downto 0);
		output1, output2: out std_logic_vector(15 downto 0);
		sel_in, sel_out1, sel_out2: in std_logic_vector(2 downto 0);
		clk, wr_ena: in std_logic);
		
	end component;
		


	signal  input: std_logic_vector(15 downto 0);
	signal	clk,wr_ena: std_logic;
	signal	sel_in,sel_out1,sel_out2: std_logic_vector(2 downto 0);
	signal  output1, output2:std_logic_vector(15 downto 0);
	

	
	
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
	
	DUT: register_file
	port map(
		input => input,
		wr_ena   => wr_ena,	
		clk   => clk, 
		output1 => output1,
		output2 => output2,
		sel_in => sel_in,
		sel_out1 => sel_out1,
		sel_out2 => sel_out2);

		
	
	main: process
	
	file f : text open read_mode is "reg_file.txt";
	variable input_test: std_logic_vector(15 downto 0);
	variable sel_in_test,sel_out1_test,sel_out2_test: std_logic_vector(2 downto 0);
	variable output1_test,output2_test: std_logic_vector(15 downto 0);
	variable wr_ena_test : std_logic;
	variable L : line ;
	variable fail : integer := 0;
	
	begin
		while not endfile(f) loop
		
			readline(f,L);
			read(L,input_test);
			read(L,wr_ena_test);
			read(L,sel_in_test);
			read(L,sel_out1_test);
			read(L,sel_out2_test);
			read(L,output1_test);
			read(L,output2_test);
			
			report "X: " & vec_to_str(input_test) &LF;
			
			clk <= '1';
			wait for 1 ns;

			input <= input_test;
			wr_ena   <= wr_ena_test;
			sel_in   <= sel_in_test;
			sel_out1   <= sel_out1_test;
			sel_out2   <= sel_out2_test;
			
			wait for 7 ns ;
			
			clk <= '0';
			wait for 8 ns ;
			--clk <= '0';
			--wait for 4 ns;
			

			if(wr_ena_test = '0') then 

			if (not output1_test = output1 ) then
				fail := fail + 1;
				report "Error : " & "E: " & vec_to_str(output1_test) & " O: " & vec_to_str(output1);
			end if;
			if(not output2_test = output2 ) then
				fail := fail + 1;
				report "Error : " & "E: " & vec_to_str(output2_test) & " O: " & vec_to_str(output2);
			end if;
			end if;			
			end loop ;
			
			assert false report "Test completed. " & integer'image (fail) & " failures."
			severity note;
		wait;
	end process ;
end test;
