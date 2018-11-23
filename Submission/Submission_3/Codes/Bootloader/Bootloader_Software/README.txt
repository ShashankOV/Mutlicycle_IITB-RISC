Author	: OV Shashank
Date	: 05-11-2016

Files:
- serial_boot.py
- assembler.py

Functions:
The two files when placed in the same folder can 
be used to bootload the IITB-RISC processor with
any code. This folder conatins its software component.
Hardware component can be found in the other folder.

Instructions to Run: 
-Note: Only the serial_boot.py must be run
-Hardware Dependencies: Make sure your hardware meets the conditions
	as listed in the Bootloader Hardware folder
-Software Dependencies: Python 2 and above, TXT file containing code 
	written in assembly (Syntax described later)
-From the command window/bash run the command "python serial_boot.py"
-Choose the COM port to be used
-Enter the name/path of the text file containing the assembly code
-Voila! Your processor has been sent the code
-(If the processor doesn't start running the code - Your Fault :P)

Input Syntax
-Use "," to separate instruction inputs (Eg. ...R1, R2...)
-Use " " to separate instructions from their inputs (Eg. ADD R1, R2...)
-Instructions are as in the ISA Definitions
-Line starting with a ";" are ignored during assembly
	Can be used to comment. In-line comments not supported.
	Eg. "; This is a comment"
-ORG can be used to place an instruction at any address