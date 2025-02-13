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
		  
		  //lw 0x1f, 0x00, 0x0000: Addr <- R[0x00] + SEXT(0x0000); R[0x1f] <- M[Addr];		
		  InstROM[8'h01] = {OP_lw, 5'b00000, 5'b11111, 16'h0000};		//PC = 0x04; INST = 32'h8c1f0000;
		  InstROM[8'h02] = {OP_R_type, 5'b00000, 5'b11111, 5'b11110, shamt, FUNC_sub};		//PC = 0x08; INST = 32'h001ff022;
		  InstROM[8'h03] = {OP_R_type, 5'b10000, 5'b11111, 5'b11101, shamt, FUNC_add};		//PC = 0x0c; INST = 32'h021fe820;
		  InstROM[8'h04] = {OP_R_type, 5'b00000, 5'b11101, 5'b11100, shamt, FUNC_sub};		//PC = 0x10; INST = 32'h001de022;
		  InstROM[8'h05] = {OP_R_type, 5'b10000, 5'b11100, 5'b11011, shamt, FUNC_add};		//PC = 0x14; INST = 32'h021fe820;
  		  InstROM[8'h06] = {OP_R_type, 5'b11111, 5'b00001, 5'b11010, shamt, FUNC_subu};		//PC = 0x18; INST = 32'h03e1d023;
		  InstROM[8'h07] = {OP_R_type, 5'b00001, 5'b11111, 5'b11001, shamt, FUNC_slt};		//PC = 0x1c; INST = 32'h003fc82a;
		  InstROM[8'h08] = {OP_R_type, 5'b00001, 5'b11111, 5'b11000, shamt, FUNC_sltu};		//PC = 0x20; INST = 32'h003fc02b;
		  InstROM[8'h09] = {OP_addiu, 5'b00000, 5'b10111, 16'hab00};		//PC = 0x24; INST = 32'h2417ab00;
		  InstROM[8'h0a] = {OP_addiu, 5'b00000, 5'b10110, 16'h00cd};		//PC = 0x28; INST = 32'h241600cd;
		  InstROM[8'h0b] = {OP_ori, 5'b10110, 5'b10101, 16'hab00};		//PC = 0x2c; INST = 32'h36d5ab00;
		  InstROM[8'h0c] = {OP_sw, 5'b00000, 5'b10101, 16'h001f};		//PC = 0x30; INST = 32'hac15001f;
		  InstROM[8'h0d] = {OP_beq, 5'b10101, 5'b10100, 16'h0003};		//PC = 0x34; INST = 32'h12b40003;
		  InstROM[8'h0e] = {OP_lw, 5'b00000, 5'b10100, 16'h001f};		//PC = 0x38; INST = 32'h8c14001f;
		  InstROM[8'h0f] = {OP_beq, 5'b10101, 5'b10100, 16'h0003};		//PC = 0x3c; INST = 32'h12b40003;
		  InstROM[8'h13] = {OP_jump, 26'h000000f};		//PC = 0x4c; INST =32'h0800000f ;
		  
	  end
	
endmodule
