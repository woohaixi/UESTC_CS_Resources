`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:50 08/04/2024 
// Design Name: 
// Module Name:    Ifetch 
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
module Ifetch(CLK, Jump, Branch, Zero, imm16, INST, ADDR
    );
	 input CLK;			//CLK-时钟信号；
	 input Jump;		//Jump-无条件转移信号；
	 input Branch;		//Branch-条件转移信号；
	 input Zero;		//Zero-加法器零标志；
	 input [15:0] imm16;		//imm16-指令当中的16位立即数字段；
	 output [31:0] INST;	//INST-输出指令；
	 output [31:0] ADDR;	//当前指令地址；
	 
	 wire [31:0] PCin;		//PCin-PC数据输入；
	 wire [31:0] PCout;		//PCout-PC数据输出；
	 wire [31:0] PC_Plus_4;		//PC_Plus_4-当前PC加4；
	 wire [31:0] SEXTout;		//SEXTout-符号扩展器输出；
	 wire [31:0] Addr_Beq;		//Addr_Beq-条件跳转地址；
	 wire [31:0] Addr_Jump;		//Addr_Jump-无条件跳转地址；
	 wire [31:0] Addr_NJump;	//Addr_NJump-不是无条件跳转指令的地址；
	 
	 PC U1 (.CLK(CLK), .PCin(PCin), .PCout(PCout));
	 Adder32 U2 (.A(PCout), .B(32'h4), .F(PC_Plus_4), .Cin(1'b0), .Cout(),
                .OF(), .SF(), .ZF(), .CF()
    				);
	 SEXT U3 (.datain(imm16), .dataout(SEXTout));
	 Adder32 U4 (.A(PC_Plus_4), .B(SEXTout << 2), .F(Addr_Beq), .Cin(1'b0), .Cout(),
                .OF(), .SF(), .ZF(), .CF()
    				);
	 MUX32_2_1 U5 (.X1(Addr_Beq), .X0(PC_Plus_4), .S(Branch & Zero), .Y(Addr_NJump));
	 MUX32_2_1 U6 (.X1(Addr_Jump), .X0(Addr_NJump), .S(Jump), .Y(PCin));
	 InstROM U7 (.Addr(PCout), .INST(INST));
	 
	 assign Addr_Jump = {PCout[31:28], INST[25:0], 2'b00};
	 assign ADDR = PCout;

endmodule
