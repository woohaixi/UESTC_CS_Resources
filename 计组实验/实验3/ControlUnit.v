`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:57:30 08/04/2024 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(OP, func, 
                   RegWr, ALUSrc, RegDst,
						 MemtoReg, MemWr, Branch, Jump,
						 ExtOp, ALUctr
    );
	 input [5:0] OP;		//OP-指令类型编码；
	 input [5:0] func;	//func-R_type指令功能编码；
	 output RegWr;			//RegWr-寄存器写信号；
	 output ALUSrc;		//ALUSrc-选择ALU第二个操作数；
	 output RegDst;		//RegDst-选择目的寄存器；
	 output MemtoReg;		//MemtoReg-选择写入寄存器的数据；
	 output MemWr;			//MemWr-存储器写信号；
	 output Branch;		//Branch-条件转移指令判断信号；
	 output Jump;			//Jump-无条件转移指令判断信号；
	 output ExtOp;			//ExtOp-选择进行符号扩展还是零扩展；
	 output [2:0] ALUctr;		//ALUctr-ALU控制信号；
	 
	 wire [2:0] ALUop;		//ALUop-非R_type指令时根据指令类型给出ALU控制信号；	
	 wire [2:0] ALUop_R;		//ALUop_R-R_type指令时根据func编码给出ALU控制信号；
	 wire R_type;		//R_type-判断当前指令是否为R_type指令；
	 
	 ControlUnit_main U1 (.OP(OP), .RegWr(RegWr), .ALUSrc(ALUSrc), .RegDst(RegDst), 
                         .MemtoReg(MemtoReg), .MemWr(MemWr), .Branch(Branch), .Jump(Jump),
								 .ExtOp(ExtOp), .ALUop(ALUop), .R_type(R_type)
                         );
    ControlUnit_ALU U2 (.func(func), .ALUctr(ALUop_R));
	 MUX3_2_1 U3 (.X1(ALUop_R), .X0(ALUop), .S(R_type), .Y(ALUctr));

endmodule
