`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:52 11/21/2024 
// Design Name: 
// Module Name:    CPU 
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
module CPU(CLK,PC,INST,R
    );
	 input CLK;
	 output[31:0]PC;
	 output[31:0]INST;
	 output[31:0]R;
	 
	 wire Branch,Jump,Z;
	 wire[15:0]immd;
	 Ifetch ifetch(.CLK(CLK),.Jump(Jump),.Branch(Branch),.Zero(Z),.imm16(immd),.INST(INST),.ADDR(PC));
	 
	 wire[5:0]Op;
	 wire[4:0]Rs;
	 wire[4:0]Rt;
	 wire[4:0]Rd;
	 wire[5:0]func;
	 
	 assign Op=INST[31:26];
	 assign Rs=INST[25:21];
	 assign Rt=INST[20:16];
	 assign Rd=INST[15:11];
	 assign immd=INST[15:0];
	 assign func=INST[5:0];
	 
	 wire RegWr,ALUsrc,RegDst,MemtoReg,MemWr,ExtOp;
	 wire [2:0]ALUctr;
	 ControlUnit ctru(.OP(Op),.func(func),.RegWr(RegWr),.ALUSrc(ALUsrc),.RegDst(RegDst),.MemtoReg(MemtoReg),.MemWr(MemWr),.Branch(Branch),.Jump(Jump),.ExtOp(ExtOp),.ALUctr(ALUctr));
	 
	 wire [4:0]Rw;
	 wire WE;
	 wire [31:0]busW;
	 wire [31:0]busA,busB;
	 
	 MUX5_2_1 mux5_2_1(.X1(Rd),.X0(Rt),.S(RegDst),.Y(Rw));
	 RegFiles regf(.CLK(CLK),.busW(busW),.WE(WE),.Rw(Rw),.Ra(Rs),.Rb(Rt),.busA(busA),.busB(busB));
	 
	 wire[31:0]Extout;
	 Ext ext(.imm16(immd),.ExtOp(ExtOp),.Extout(Extout));
	 
	 wire [31:0]data_B;
	 MUX32_2_1 mux32_2_1(.X1(Extout),.X0(busB),.S(ALUsrc),.Y(data_B));
	 
	 wire Overflow;
	 wire [31:0]Result;
	 ALU alu(.X(busA),.Y(data_B),.ALUctr(ALUctr),.R(Result),.Overflow(Overflow),.Zero(Z));
	 
	 wire Overout;
	 assign Overout=~Overflow;
	 assign WE=RegWr&Overout;
	 
	 wire [31:0]Dout;
	 DataRAM dataram(.CLK(CLK),.DataIn(busB),.WE(MemWr),.Address(Result),.DataOut(Dout));
	 
	 MUX32_2_1 mux32_2_1_2(.X1(Dout),.X0(Result),.S(MemtoReg),.Y(busW));
	 
	 assign R=Result;
	 


endmodule
