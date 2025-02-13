`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:11:00 07/29/2024 
// Design Name: 
// Module Name:    DataRAM 
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
module DataRAM(CLK, DataIn, WE, Address, DataOut
    );
	 input CLK, WE;		//CLK-时钟信号； WE-写操作使能信号；
	 input [31:0] DataIn, Address;		//DataIn-写数据输入信号； Address-读写地址信号
	 output [31:0] DataOut;		//DataOut-读数据输出信号；
	 
	 reg [31:0] RAM [31:0];		//RAM-存储器数组建模；
	 
	 always @ (negedge CLK)
	   if(WE) RAM[Address[4:0]] <= DataIn;		//写操作；
		
	 assign DataOut = RAM[Address[4:0]];		//读操作；
	 
	 integer i;		//存储器初始化；
	 initial 
	   begin
		  for (i = 0; i < 32; i = i + 1)
		    RAM[i] = 32'h80000000 + i;
	   end
	 
endmodule
