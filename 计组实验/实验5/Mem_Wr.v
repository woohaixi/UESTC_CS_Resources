`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:14 11/28/2024 
// Design Name: 
// Module Name:    Mem_Wr 
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
module Mem_Wr(CLK,M_Dout,M_ALUout,M_MemtoReg,M_RegWr,M_Overflow,M_Rw,M_PCSrc,W_Overflow,W_Dout,W_ALUout,W_Rw,
W_MemtoReg,W_RegWr,W_PCSrc);
	 input CLK,M_Overflow;
	 input [31:0]M_Dout,M_ALUout;
	 input[4:0]M_Rw;
	 input M_MemtoReg,M_RegWr,M_PCSrc;
	 output reg W_Overflow;
	 output reg [31:0]W_Dout,W_ALUout;
	 output reg[4:0]W_Rw;
	 output reg W_MemtoReg,W_RegWr,W_PCSrc;
	 
	 always@(negedge CLK)
	 begin
		W_Overflow<=M_Overflow;
		W_Dout<=M_Dout;
		W_ALUout<=M_ALUout;
		W_Rw<=M_Rw;
		W_MemtoReg<=M_MemtoReg;
		W_RegWr<=M_RegWr;
		W_PCSrc<=M_PCSrc;
	end;
	
	initial begin
		W_Overflow=1'h0;
		W_Dout=32'h0;
		W_ALUout=32'h0;
		W_Rw=5'h0;
		W_MemtoReg=1'h0;
		W_RegWr=1'h0;
		W_PCSrc=1'h0;
	end;
	
endmodule
