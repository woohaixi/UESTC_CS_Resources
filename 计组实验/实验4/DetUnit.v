`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:05 11/30/2024 
// Design Name: 
// Module Name:    DetUnit 
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
module DetUnit(E_Rs, E_Rt, E_ALUSrc, M_Rw, W_Rw, M_RegWr, W_RegWr,
               ALUSrcA, ALUSrcB
    );
	 input [4:0] E_Rs;		//E_Rs-Ex级指令的第一个寄存器操作数；
	 input [4:0] E_Rt;		//E_Rt-Ex级指令的第二个寄存器操作数；
	 input [4:0] M_Rw;		//M_Rw-Mem级指令的写寄存器地址；
	 input [4:0] W_Rw;		//W_Rw-Wr级指令的写寄存器地址；
	 input E_ALUSrc;		//E_ALUSrc-Ex级指令第二个ALU操作数的选择信号；
	 input M_RegWr;		//M_RegWr-Mem级指令寄存器写标志；
	 input W_RegWr;		//W_RegWr-Wr级指令寄存器写标志
	 output [1:0] ALUSrcA;		//ALUSrcA-Ex级数据前推通路中ALU第一个操作数的数据选择信号；
	 output [1:0] ALUSrcB;		//ALUSrcB-Ex级数据前推通路中ALU第二个操作数的数据选择信号；
	 
	 wire C1A = M_RegWr && (M_Rw == E_Rs);		//C1A-Ex级指令的第一个ALU操作数与Mem级的写寄存器数据间存在数据冒险；
	 wire C1B = M_RegWr && (M_Rw == E_Rt);		//C1B-Ex级指令的第二个ALU操作数与Mem级的写寄存器数据间存在数据冒险；
	 wire C2A = W_RegWr && (W_Rw == E_Rs);		//C2A-Ex级指令的第一个ALU操作数与Wr级的写寄存器数据间存在数据冒险；
	 wire C2B = W_RegWr && (W_Rw == E_Rt);		//C2B-Ex级指令的第二个ALU操作数与Wr级的写寄存器数据间存在数据冒险；
	 
	 assign ALUSrcA = C1A ? 2'b01 : 
	                  C2A ? 2'b10 : 2'b00;
	 assign ALUSrcB = E_ALUSrc ? 2'b11 :
	                  C1B ? 2'b01 : 
							C2B ? 2'b10 : 2'b00;

endmodule
