`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:49 08/04/2024 
// Design Name: 
// Module Name:    ControlUnit_ALU 
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
module ControlUnit_ALU(func, ALUctr
    );
	 input [5:0] func;
	 output [2:0] ALUctr;
	 
	 assign ALUctr[2] = !func[2] & func[1];
	 assign ALUctr[1] = func[3] & !func[2] & func[1];
	 assign ALUctr[0] = !func[3] & !func[2] & !func[0] | !func[2] & func[1] & !func[0];

endmodule
