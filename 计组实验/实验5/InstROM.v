`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/03 23:58:22
// Design Name: 
// Module Name: InstROM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstROM(Addr, INST
    );
	input [31:0] Addr;		//Addr-指令地址；
	output [31:0] INST;		//INST-输出指令；
	
	reg [31:0] InstROM [255:0];		//InstROM-指令存储器建模；

   assign INST = InstROM[Addr[9:2]];
	
	parameter [5:0] OP_R_type = 6'b000000;
	parameter [5:0] OP_ori = 6'b001101;
	parameter [5:0] OP_addiu = 6'b001001;
	parameter [5:0] OP_lw = 6'b100011;
	parameter [5:0] OP_sw = 6'b101011;
	parameter [5:0] OP_beq = 6'b000100;
	parameter [5:0] OP_jump = 6'b000010;
	parameter [4:0] shamt = 5'b00000;
	parameter [5:0] FUNC_add = 6'b100000;
	parameter [5:0] FUNC_sub = 6'b100010;
	parameter [5:0] FUNC_subu = 6'b100011;
	parameter [5:0] FUNC_slt = 6'b101010;
	parameter [5:0] FUNC_sltu = 6'b101011;
	
	integer i;
	initial 
	  begin
	    for(i = 0; i < 256; i = i + 1)
		  InstROM[i] = 32'h00000000;
		 
		  InstROM[8'h01] = {OP_R_type, 5'b00110, 5'b00011, 5'b00001, shamt, FUNC_sub};		//PC = 0x04; INST = 32'h8c1f0000;
		  InstROM[8'h02] = {OP_beq,5'b00001,5'b00011,16'h0003};		//PC = 0x04; INST = 32'h8c1f0000;
		  InstROM[8'h03] = {OP_ori, 5'b00010, 5'b00100,16'h0008};		//PC = 0x0c; INST = 32'h021fe820;
		  InstROM[8'h04] = {OP_R_type, 5'b00011, 5'b00011, 5'b00101, shamt, FUNC_add};		//PC = 0x10; INST = 32'h001de022;
		  InstROM[8'h05] = {OP_R_type, 5'b00010, 5'b01000, 5'b00110, shamt, FUNC_add};		  //PC = 0x14; INST = 32'h021fe820;
		  InstROM[8'h05] = {OP_lw, 5'b00100, 5'b01111,16'h0000};
	  end
	
endmodule
