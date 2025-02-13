`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:59 12/01/2024 
// Design Name: 
// Module Name:    DetUnit_load 
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
module DetUnit_load(E_MemtoReg, Rs, Rt, E_Rt, load_use
    );
	 input E_MemtoReg;				//E_MemtoReg-Ex级指令的MemtoReg信号，表示Ex级的指令是否为lw指令；
	 input [4:0] Rs;				//Rs-ID级指令的第一个寄存器操作数；
	 input [4:0] Rt;				//Rs-ID级指令的第二个寄存器操作数；
	 input [4:0] E_Rt;			//E_Rt-Ex级指令的第二个寄存器操作数；
	 output load_use;			//load_use-load-use数据冒险标志；
	 
	 assign load_use = E_MemtoReg && ((E_Rt == Rs) || (E_Rt == Rt));

endmodule
