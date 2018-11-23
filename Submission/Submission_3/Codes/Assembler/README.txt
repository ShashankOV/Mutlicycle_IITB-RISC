Author: Kalpesh and Shashank

Files
-assembler.py	(Assembler)
-fpga_test.txt	(Sample Input)
-mem.hex		(Sample Output)

Input Syntax
-Use "," to separate instruction inputs (Eg. ...R1, R2...)
-Use " " to separate instructions from their inputs (Eg. ADD R1, R2...)
-Instructions are as in the ISA Definitions
-Line starting with a ";" are ignored during assembly
	Can be used to comment. In-line comments not supported.
	Eg. "; This is a comment"
-ORG can be used to place an instruction at any address

How to run?
-Run the command "python3 assembler.py <input_file_name> <output_file_name>"
-Output is in a valid INTEL HEX file format