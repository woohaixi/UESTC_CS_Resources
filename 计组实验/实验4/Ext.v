`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:42 08/04/2024 
// Design Name: 
// Module Name:    Ext 
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
module Ext(imm16, ExtOp, Extout
    );
	 input [15:0] imm16;			//imm16-16位立即数输入；
	 input ExtOp;					//ExtOp-1:做符号扩展；0：做零扩展；
	 output [31:0] Extout;		//Extout-扩展后的32位数据输出；
	 
	 assign Extout = ExtOp ? {{16{imm16[15]}}, imm16} : {16'h0000, imm16};

endmodule
