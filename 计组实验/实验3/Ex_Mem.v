`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:49 11/28/2024 
// Design Name: 
// Module Name:    Ex_Mem 
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
module Ex_Mem(CLK,E_Jtarg,E_Btarg,E_Zero,E_Overflow,E_ALUout,E_busB,E_Rw, E_MemWr,E_Jump,E_Branch,E_MemtoReg,E_RegWr,M_Btarg,M_Jtarg,M_Zero,M_busB,M_ALUout,M_Overflow,M_Rw,
M_MemWr,M_Jump,M_Branch,M_MemtoReg,M_RegWr);
	 input [31:0]E_Jtarg,E_Btarg,E_ALUout,E_busB;
	 input CLK,E_Zero,E_Overflow;
	 input[4:0]E_Rw;
	 input E_MemWr,E_Jump,E_Branch,E_MemtoReg,E_RegWr;
	 output reg[31:0]M_Btarg,M_Jtarg,M_busB,M_ALUout;
	 output reg M_Zero,M_Overflow,M_MemWr,M_Jump,M_Branch,M_MemtoReg,M_RegWr;
	 output reg [4:0]M_Rw;
	 
	 always@(negedge CLK)
	 begin
		M_Btarg<=E_Btarg;
		M_Jtarg<=E_Jtarg;
		M_busB<=E_busB;
		M_ALUout<=E_ALUout;
		M_Zero<=E_Zero;
		M_Overflow<=E_Overflow;
		M_Rw<=E_Rw;
		M_MemWr<=E_MemWr;
		M_Jump<=E_Jump;
		M_Branch<=E_Branch;
		M_MemtoReg<=E_MemtoReg;
		M_RegWr<=E_RegWr;
	 end;
	
	initial begin
		M_Btarg=32'h0;
		M_Jtarg=32'h0;
		M_busB=32'h0;
		M_ALUout=32'h0;
		M_Zero=1'h0;
		M_Overflow=1'h0;
		M_Rw=5'h0;
		M_MemWr=1'h0;
		M_Jump=1'h0;
		M_Branch=1'h0;
		M_MemtoReg=1'h0;
		M_RegWr=1'h0;
	end 


endmodule
