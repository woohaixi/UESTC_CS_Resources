`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:42:47 08/04/2024 
// Design Name: 
// Module Name:    SEXT 
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
module SEXT(datain, dataout
    );
	 input [15:0] datain;
	 output [31:0] dataout;
	 
	 assign dataout = {{16{datain[15]}}, datain};

endmodule
