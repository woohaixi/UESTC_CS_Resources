`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:12:28 12/12/2024
// Design Name:   PPCPU
// Module Name:   C:/Users/PPCPU2/test1.v
// Project Name:  PPCPU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PPCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg CLK;

	// Outputs
	wire [31:0] I_PC;
	wire [31:0] I_Inst;
	wire [31:0] Inst;
	wire [31:0] E_ALUout;
	wire [31:0] M_ALUout;
	wire [31:0] W_RegDin;

	// Instantiate the Unit Under Test (UUT)
	PPCPU uut (
		.CLK(CLK), 
		.I_PC(I_PC), 
		.I_Inst(I_Inst), 
		.Inst(Inst), 
		.E_ALUout(E_ALUout), 
		.M_ALUout(M_ALUout), 
		.W_RegDin(W_RegDin)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;

		// Wait 100 ns for global reset to finish
	
        
		// Add stimulus here

	end
      always #20 CLK=~CLK;
endmodule

