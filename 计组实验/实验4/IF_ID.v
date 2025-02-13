`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:41 11/24/2024 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(Clk,EN,I_PC4, I_PC, I_Inst, PC4, PC, Inst
    );
	 input Clk;
	 input EN;
	 input [31:0] I_PC4, I_PC, I_Inst;		//从IF流水段输入的信号�
	 output reg [31:0] PC4, PC, Inst;		//输出至ID流水段的信号�
	 
	 always @ (negedge Clk)
		if(EN)
			begin
				  PC4  <= I_PC4;
				  PC   <= I_PC;
				  Inst <= I_Inst;
			end
				
	 initial begin							//对流水线寄存器进行初始化�
	   PC4 = 32'h0; PC = 32'h0; Inst = 32'h0;
	 end
endmodule
