`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:40 11/28/2024 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(CLK,Clrn,PC4,Jtarg,func,immd,busA,busB,Rt,Rd,Rs,ExtOp,ALUSrc,RegDst,R_type,ALUOp,MemWr,Jump,Branch,MemtoReg,
RegWr,E_Jtarg,E_PC4,E_busA,E_busB,E_immd,E_func,E_Rt,E_Rd,E_Rs,E_ExtOp,E_ALUSrc,E_RegDst,E_ALUOp,
E_R_type,E_MemWr,E_Jump,E_Branch,E_MemtoReg,
E_RegWr);
input CLK;
input Clrn;
input [31:0]Jtarg,PC4;
input[5:0]func;
input [15:0]immd;
input[31:0]busA,busB;
input[4:0]Rt,Rd,Rs;
input ExtOp,ALUSrc,RegDst,R_type;
input[2:0]ALUOp;
input MemWr,Jump,Branch,MemtoReg,RegWr;

output reg[31:0]E_Jtarg,E_PC4,E_busA,E_busB;
output reg[15:0]E_immd;
output reg[5:0]E_func;
output reg[4:0]E_Rt,E_Rd,E_Rs;
output reg E_ExtOp;
output reg E_ALUSrc;
output reg E_RegDst;
output reg [2:0]E_ALUOp;
output reg E_R_type;
output reg E_MemWr,E_Jump,E_Branch,E_MemtoReg,E_RegWr;

always@(negedge CLK)
	if(!Clrn)
		begin
		  E_Jtarg<=32'h0;
		  E_PC4<=32'h0;
		  E_busA<=32'h0;
		  E_busB<=32'h0;
		  E_immd<=16'h0;
		  E_func<=6'h0;
		  E_Rt<=5'h0;
		  E_Rd<=5'h0;
		  E_Rs<=5'h0;
		  E_ExtOp<=1'h0;
		  E_ALUSrc<=1'h0;
		  E_RegDst<=1'h0;
		  E_ALUOp<=3'h0;
		  E_R_type<=1'h0;
		  E_MemWr<=1'h0;
		  E_Jump<=1'h0;
		  E_Branch<=1'h0;
		  E_MemtoReg<=1'h0;
		  E_RegWr<=1'h0;
		end
		
	else
		begin
			E_Jtarg<=Jtarg;
			E_PC4<=PC4;
			E_busA<=busA;
			E_busB<=busB;
			E_immd<=immd;
			E_func<=func;
			E_Rt<=Rt;
			E_Rd<=Rd;
			E_Rs<=Rs;
			E_ExtOp<=ExtOp;
			E_ALUSrc<=ALUSrc;
			E_RegDst<=RegDst;
			E_ALUOp<=ALUOp;
			E_R_type<=R_type;
			E_MemWr<=MemWr;
			E_Jump<=Jump;
			E_Branch<=Branch;
			E_MemtoReg<=MemtoReg;
			E_RegWr<=RegWr;
		end


initial begin
  E_Jtarg=32'h0;
  E_PC4=32'h0;
  E_busA=32'h0;
  E_busB=32'h0;
  E_immd=16'h0;
  E_func=6'h0;
  E_Rt=5'h0;
  E_Rd=5'h0;
  E_Rs=5'h0;
  E_ExtOp=1'h0;
  E_ALUSrc=1'h0;
  E_RegDst=1'h0;
  E_ALUOp=3'h0;
  E_R_type=1'h0;
  E_MemWr=1'h0;
  E_Jump=1'h0;
  E_Branch=1'h0;
  E_MemtoReg=1'h0;
  E_RegWr=1'h0;
end


endmodule
