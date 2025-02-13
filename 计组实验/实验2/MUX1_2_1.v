`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:27 11/21/2024 
// Design Name: 
// Module Name:    MUX1_2_1 
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
module MUX1_2_1(X1,X0,S,Y
    );
	 input X1,X0;
	 input S;
	 output Y;
	 assign Y=(S==1'b0)?X0:(S==1'b1)?X1:1'bz;
endmodule
