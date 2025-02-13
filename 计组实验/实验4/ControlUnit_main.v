`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:33 08/04/2024 
// Design Name: 
// Module Name:    ControlUnit_main 
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
module ControlUnit_main(OP, RegWr, ALUSrc, RegDst, 
                        MemtoReg, MemWr, Branch, Jump,
								ExtOp, ALUop, R_type
    );
	 input [5:0] OP;		//OP-指令类型编码；
	 output RegWr;			//RegWr-寄存器写信号；
	 output ALUSrc;		//ALUSrc-选择ALU第二个操作数；
	 output RegDst;		//RegDst-选择目的寄存器；
	 output MemtoReg;		//MemtoReg-选择写入寄存器的数据；
	 output MemWr;			//MemWr-存储器写信号；
	 output Branch;		//Branch-条件转移指令判断信号；
	 output Jump;			//Jump-无条件转移指令判断信号；
	 output ExtOp;			//ExtOp-选择进行符号扩展还是零扩展；
	 output [2:0] ALUop;			//ALUop-非R_type指令时根据指令类型给出ALU控制信号；
	 output R_type;		//R_type-判断当前指令是否为R_type指令；
	 
	 wire ori = !OP[5] & !OP[4] & OP[3] & OP[2] & !OP[1] & OP[0];			//ori-OP=6'b001101；
	 wire addiu = !OP[5] & !OP[4] & OP[3] & !OP[2] & !OP[1] & OP[0];		//addiu-OP=6'b001001；
	 wire lw = OP[5] & !OP[4] & !OP[3] & !OP[2] & OP[1] & OP[0];			//lw-OP=6'b100011；
	 wire sw = OP[5] & !OP[4] & OP[3] & !OP[2] & OP[1] & OP[0];			//sw-OP=6'b101011；
	 wire beq = !OP[5] & !OP[4] & !OP[3] & OP[2] & !OP[1] & !OP[0];			//beq-OP=6'b000100；
	 wire jump = !OP[5] & !OP[4] & !OP[3] & !OP[2] & OP[1] & !OP[0];			//jump-OP=6'b000010；
	 
	 assign RegWr = R_type | ori | addiu | lw;
	 assign ALUSrc = ori | addiu | lw | sw;
	 assign RegDst = R_type;
	 assign MemtoReg = lw;
	 assign MemWr = sw;
	 assign Branch = beq;
	 assign Jump = jump;
	 assign ExtOp = addiu | lw | sw;
	 assign ALUop[0] = R_type;
	 assign ALUop[1] = ori;
	 assign ALUop[2] = beq;
	 assign R_type = !OP[5] & !OP[4] & !OP[3] & !OP[2] & !OP[1] & !OP[0];

endmodule
