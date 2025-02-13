`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:44 07/31/2024 
// Design Name: 
// Module Name:    FA 
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
module FA(X, Y, C, F, G, P
    );
	 input X, Y;		//X-被加数； Y-加数；
	 input C;		//C-进位输入；
	 output F;		//F-结果；
	 output G, P;		//G-进位生成函数； P-进位传递函数；
	 
	 assign F = X ^ Y ^ C;
	 assign G = X & Y;
	 assign P = X + Y;

endmodule
