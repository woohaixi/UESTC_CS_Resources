`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:45 11/21/2024 
// Design Name: 
// Module Name:    MUX5_2_1 
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
module MUX5_2_1(X1,X0,S,Y
    );
	 input[4:0]X1,X0;
	 input S;
	 output[4:0]Y;
	 assign Y=(S==1'b0)?X0:(S==1'b1)?X1:5'bzzzzz;


endmodule
