`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:33:17 08/04/2024 
// Design Name: 
// Module Name:    RegisterFiles 
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
module RegFiles(CLK, busW, WE, Rw, Ra, Rb, busA, busB
    );
	 input CLK;			//CLK-写入时钟信号；
	 input [31:0] busW;		//busW-写入数据；
	 input WE;			//WE-写使能信号；
	 input [4:0] Rw;			//Rw-写数据地址；
	 input [4:0] Ra, Rb;		//Ra,Rb-读数据地址；
	 output [31:0] busA, busB;		//busA,busB-读数据信号；
	 
	 reg [31:0] RegFiles [31:0];		//通用寄存器组建模
	 
	 always @ (negedge CLK)
	   if(WE) RegFiles[Rw] <= busW;
		
	 assign busA = RegFiles[Ra];
	 assign busB = RegFiles[Rb];
	 
	 integer i;
	 initial
	   begin
		  for(i = 0; i < 32; i = i + 1)
		    RegFiles[i] = i;
		end

endmodule
