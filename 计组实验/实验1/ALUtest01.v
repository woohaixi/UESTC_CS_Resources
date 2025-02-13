`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:57:02 12/01/2024
// Design Name:   ALU
// Module Name:   C:/Users/SingleCPU/test001.v
// Project Name:  SingleCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test001;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [2:0] ALUctr;

	// Outputs
	wire [31:0] R;
	wire Overflow;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.X(X), 
		.Y(Y), 
		.ALUctr(ALUctr), 
		.R(R), 
		.Overflow(Overflow), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		ALUctr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		X = 0;
		Y = 0;
		ALUctr = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		#30;
		X=32'h80000000;
		Y=32'hf0000000;
		ALUctr=3'b001;
		
		#30;
		X=32'h80000000;
		Y=32'hf0000000;
		ALUctr=3'b000;
		
		#30;
		X=32'h80000000;
		Y=32'h10000000;
		ALUctr=3'b101;
		
		#30
		X=32'h80000000;
		Y=32'h10000000;
		ALUctr=3'b100;
		
		#30;
		X=32'h90000000;
		Y=32'ha0000000;
		ALUctr=3'b010;
		
		#30;
		X=32'h80000000;
		Y=32'ha0000000;
		ALUctr=3'b110;
		
		#30;
		X=32'h80000000;
		Y=32'h10000000;
		ALUctr=3'b110;
		
		#30;
		X=32'h80000000;
		Y=32'h10000000;
		ALUctr=3'b111;
		
		#30;
		X=32'h60000000;
		Y=32'h10000000;
		ALUctr=3'b111;//分开仿真，一次最多容纳七个!!		
	
	end
      
endmodule

