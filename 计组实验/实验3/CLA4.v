`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:55 07/29/2024 
// Design Name: 
// Module Name:    CLA4 
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
module CLA4(G3, G2, G1, G0,
            P3, P2, P1, P0,
			   C3, C2, C1, C0,
			   Cin
    );
	 input G3, G2, G1, G0;		//G-进位生成函数；
	 input P3, P2, P1, P0;		//P-进位传递函数；
	 input Cin;		//Cin-低位进位输入；
	 output C3, C2, C1, C0;		//逐级进位输出
	 
	 assign C0 = G0 + (P0 & Cin);
	 assign C1 = G1 + (P1 & G0) + (P1 & P0 & Cin);
	 assign C2 = G2 + (P2 & G1) + (P2 & P1 & G0) + (P2 & P1 & P0 & Cin);
	 assign C3 = G3 + (P3 & G2) + (P3 & P2 & G1) + (P3 & P2 & P1 & G0) + (P3 & P3 & P1 & P0 & Cin);
 
endmodule








