`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:07 07/29/2024 
// Design Name: 
// Module Name:    Adder 
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
module Adder4(X, Y, Cin, Cout, F, Gm, Pm, C2
    );
	 input [3:0] X, Y;		//X-被加数； Y-加数；
	 input Cin;		//Cin-最低位进位输入；
	 output Cout;		//Cout-最高位进位输出；
	 output [3:0] F;		//加法结果；
	 output Gm, Pm;
	 output C2;
	 
	 wire [3:0] G, P, C;
	 
	 FA L3(.X(X[3]), .Y(Y[3]), .C(C[2]), .F(F[3]), .G(G[3]), .P(P[3]));
	 FA L2(.X(X[2]), .Y(Y[2]), .C(C[1]), .F(F[2]), .G(G[2]), .P(P[2]));
	 FA L1(.X(X[1]), .Y(Y[1]), .C(C[0]), .F(F[1]), .G(G[1]), .P(P[1]));
	 FA L0(.X(X[0]), .Y(Y[0]), .C(Cin), .F(F[0]), .G(G[0]), .P(P[0]));
	 
	 CLA4 CLA(.G3(G[3]), .G2(G[2]), .G1(G[1]), .G0(G[0]),
             .P3(P[3]), .P2(P[2]), .P1(P[1]), .P0(P[0]),
			    .C3(C[3]), .C2(C[2]), .C1(C[1]), .C0(C[0]),
			    .Cin(Cin)
				 );
				 
    assign Cout = C[3];
	 assign C2 = C[2];
	 
	 assign Gm = G[3] + (P[3] & G[2]) + (P[3] & P[2] & G[1]) + (P[3] & P[2] & P[1] & G[0]);
	 assign Pm = P[3] & P[2] & P[1] & P[0];

endmodule
