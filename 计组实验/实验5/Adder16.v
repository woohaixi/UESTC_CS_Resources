`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:35 07/31/2024 
// Design Name: 
// Module Name:    CLA16 
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
module Adder16(A, B, Cin, F, Px, Gx, C14
    );
	 input [15:0] A, B;
	 input Cin;
	 output [15:0] F;
	 output Px, Gx;
	 output C14;
	 
	 wire C15, C11, C7, C3;
	 wire Pm3, Pm2, Pm1, Pm0;
	 wire Gm3, Gm2, Gm1, Gm0;
	 
	 Adder4 U3(.X(A[15:12]), .Y(B[15:12]), .Cin(C11), .Cout(), .F(F[15:12]), .Gm(Gm3), .Pm(Pm3), .C2(C14));
	 Adder4 U2(.X(A[11:8]), .Y(B[11:8]), .Cin(C7), .Cout(), .F(F[11:8]), .Gm(Gm2), .Pm(Pm2), .C2());
	 Adder4 U1(.X(A[7:4]), .Y(B[7:4]), .Cin(C3), .Cout(), .F(F[7:4]), .Gm(Gm1), .Pm(Pm1), .C2());
	 Adder4 U0(.X(A[3:0]), .Y(B[3:0]), .Cin(Cin), .Cout(), .F(F[3:0]), .Gm(Gm0), .Pm(Pm0), .C2());
	 
	 assign C3 = Gm0 + (Pm0 & Cin);
    assign C7 = Gm1 + (Pm1 & Gm0) + (Pm1 & Pm0 & Cin);
	 assign C11 = Gm2 + (Pm2 & Gm1) + (Pm2 & Pm1 & Gm0) + (Pm2 & Pm1 & Pm0 & Cin);
 
	 assign Px = Pm3 & Pm2 & Pm1 & Pm0;
	 assign Gx = Gm3 + (Pm3 & Gm2) + (Pm3 & Pm2 & Gm1) + (Pm3 & Pm2 & Pm1 & Gm0);

endmodule
