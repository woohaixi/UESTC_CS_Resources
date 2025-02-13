`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:22 11/18/2024 
// Design Name: 
// Module Name:    ALU 
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:22 11/18/2024 
// Design Name: 
// Module Name:    ALU 
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
module MUX1(in1,in2,s,out);
	input in1,in2;
	input s;
	output out;
	assign out=(s==1'b0)?in1:
	(s==1'b1)?in2:1'bz;
endmodule

module MUX2(in1,in2,in3,in4,s,out);
	input [31:0]in1,in2,in3,in4;
	output[31:0]out;
	input[1:0]s;
	assign out=(s==2'b00)?in1:
	(s==2'b01)?in2:
	(s==2'b10)?in3:
	(s==2'b11)?in4:32'hz;
endmodule

module MUX3(in1,in2,s,out);
	input [31:0]in1,in2;
	input s;
	output [31:0]out;
	assign out=(s==1'b0)?in1:
	(s==1'b1)?in2:32'hz;
endmodule

module ALU(X,Y,ALUctr,R,Overflow,Zero
    );
	 input[31:0]X,Y;
	 input[2:0]ALUctr;
	 output[31:0]R;
	 output Overflow,Zero;
	 
	 wire[31:0]F,Data_Y;
	 wire SF,ZF,OF,CF;
	 wire SUBctr,OVctr,SIGctr;
	 wire [1:0]OPctr;
	 
	 assign SUBctr=ALUctr[2];
	 assign OVctr=(!ALUctr[1])&ALUctr[0];
	 assign SIGctr=ALUctr[0];
	 assign OPctr[1]=ALUctr[2]&ALUctr[1];
	 assign OPctr[0]=(!ALUctr[2])&ALUctr[1]&(!ALUctr[0]);
	 
	 wire [31:0]EXT_OUT;
	 assign EXT_OUT=SUBctr?32'hffffffff:32'h0;
	 
	 assign Data_Y=EXT_OUT^Y;
	 
	 Adder32 adder(.A(X),.B(Data_Y),.F(F),.Cin(SUBctr),.OF(OF),.SF(SF),.ZF(ZF),.CF(CF));
	 
	 assign Zero=ZF;
	 assign Overflow=OVctr&OF;
	 
	 wire out1,out3;
	 wire[31:0]out2,out4;
	 assign out1=OF^SF;
	 assign out2=X|Y;
	 
	 MUX1 mux1(.in1(CF),.in2(out1),.s(SIGctr),.out(out3));
	 MUX3 mux3(.in1(32'h0),.in2(32'h1),.s(out3),.out(out4));
	 MUX2 mux2(.in1(F),.in2(out2),.in3(out4),.s(OPctr),.out(R));
	 
endmodule
