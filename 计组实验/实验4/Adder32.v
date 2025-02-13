`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:56 08/01/2024 
// Design Name: 
// Module Name:    Adder32 
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
module Adder32(A, B, F, Cin, Cout,
               OF, SF, ZF, CF
    );
	 input [31:0] A, B;		//A-32位被加数； B-32位加数；
	 input Cin;		//Cin-最低位进位输入；
	 output [31:0] F;		//F-加法结果；
	 output Cout;		//Cout-最高位进位输出；
	 output OF;		//OF-溢出标志；
	 output SF;		//SF-符号标志；
	 output ZF;		//ZF-零标志；
	 output CF;		//CF-进位/借位标志；
	 
	 wire Gx1, Gx0, Px1, Px0;
	 wire C15, C31, C30;
	 
	 Adder16 LW (.A(A[15:0]), .B(B[15:0]), .Cin(Cin), .F(F[15:0]), .Px(Px0), .Gx(Gx0), .C14());
	 Adder16 HW (.A(A[31:16]), .B(B[31:16]), .Cin(C15), .F(F[31:16]), .Px(Px1), .Gx(Gx1), .C14(C30));
	 
	 assign C15 = Gx0 + (Px0 & Cin);
	 assign C31 = Gx1 + (Px1 & Gx0) + (Px1 & Px0 & Cin);
	 assign Cout = C31;
	 
	 assign OF = C31 ^ C30;
	 assign SF = F[31];
	 assign ZF = ~|F;		//规约操作符，对F信号按位相或得到一位信号后取反；
	 assign CF = Cout ^ Cin;
	 

endmodule
