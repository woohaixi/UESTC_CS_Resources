`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:57 12/06/2024 
// Design Name: 
// Module Name:    MUX32_4_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX32_4_1(in1,in2,in3,in4,s,out);
	input [31:0]in1,in2,in3,in4;
	output[31:0]out;
	input[1:0]s;
	assign out=(s==2'b00)?in1:
	(s==2'b01)?in2:
	(s==2'b10)?in3:
	(s==2'b11)?in4:32'hz;
endmodule