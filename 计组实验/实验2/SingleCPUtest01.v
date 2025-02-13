`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:36:42 11/30/2024
// Design Name:   CPU
// Module Name:   D:/SingleCPU/test03.v
// Project Name:  SingleCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test03;

	// Inputs
	reg CLK;

	// Outputs
	wire [31:0] PC;
	wire [31:0] INST;
	wire [31:0] R;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CLK(CLK), 
		.PC(PC), 
		.INST(INST), 
		.R(R)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;

		// Wait 100 ns for global reset to finish
		#25;
        
		// Add stimulus here

	end
      always #25 CLK=~CLK;
endmodule

