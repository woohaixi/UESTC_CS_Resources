`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:04 12/01/2024 
// Design Name: 
// Module Name:    PPCPU 
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
module PPCPU(CLK,I_PC,I_Inst,Inst,E_ALUout,M_ALUout,W_RegDin);
	input CLK;
	output[31:0]I_PC,I_Inst,Inst,E_ALUout,M_ALUout,W_RegDin;
	
	wire not_out2;//load_use之后的非门,实验四新增
	wire[31:0]PCin,I_PC4,PC4,PC;
	PC pc(.CLK(CLK),.EN(not_out2),.PCin(PCin),.PCout(I_PC));
	Adder32 adder1(.A(32'h4),.B(I_PC),.Cin(1'b0),.F(I_PC4));
	InstROM instrom(.Addr(I_PC),.INST(I_Inst));
	
	IF_ID if_id(.Clk(CLK),.EN(not_out2),.I_PC4(I_PC4),.I_PC(I_PC),.I_Inst(I_Inst),.PC4(PC4),.PC(PC),.Inst(Inst));
	
	wire[31:0]Jtarg;
	wire[5:0]func;
	wire[15:0]immd;
	wire[31:0]busA,busB;
	wire[4:0]Rs,Rt,Rd;
	wire[25:0]target;
	wire[5:0]OP;
	
	
	assign target=Inst[25:0];
	assign Jtarg={PC[31:28],target,2'b00};
	assign OP=Inst[31:26];
	assign func=Inst[5:0];
	assign immd=Inst[15:0];
	assign Rs=Inst[25:21];
	assign Rt=Inst[20:16];
	assign Rd=Inst[15:11];
	
	wire RegWr,ALUSrc,RegDst,MemtoReg,MemWr,Branch,Jump,ExtOp,R_type;
	wire[2:0]ALUOp;
	ControlUnit_main ctrlunitmain(.OP(OP),.RegWr(RegWr),.ALUSrc(ALUSrc),.RegDst(RegDst),.MemtoReg(MemtoReg),
	.MemWr(MemWr),.Branch(Branch),.Jump(Jump),.ExtOp(ExtOp),.ALUop(ALUOp),.R_type(R_type));
	
	wire[4:0]W_Rw;
	wire W_RegWE;
	RegFiles regfiles(.CLK(~CLK),.busW(W_RegDin),.WE(W_RegWE),.Rw(W_Rw),.Ra(Rs),.Rb(Rt),.busA(busA),.busB(busB));//这里的时钟信号改了，将寄存器的写口和读口分别控制在前后半个时钟周期内解决
	
	wire [31:0]E_Jtarg,E_PC4,E_busA,E_busB;
	wire[15:0]E_immd;
	wire[5:0]E_func;
	wire[4:0]E_Rt,E_Rd,E_Rs;
	wire E_ExtOp,E_ALUSrc,E_RegDst,E_R_type;
	wire [2:0]E_ALUOp;
	wire E_MemWr,E_Jump,E_Branch,E_MemtoReg,E_RegWr;
	
	wire or_out_not;//实验5新增
	ID_EX id_ex(.CLK(CLK),.Clrn(or_not_out),.PC4(PC4),.Jtarg(Jtarg),.func(func),.immd(immd),.busA(busA),.busB(busB),.Rt(Rt),.Rd(Rd),.Rs(Rs),
	.ExtOp(ExtOp),.ALUSrc(ALUSrc),.RegDst(RegDst),.R_type(R_type),.ALUOp(ALUOp),.MemWr(MemWr),.Jump(Jump),.Branch(Branch),.MemtoReg(MemtoReg),.RegWr(RegWr),
	.E_Jtarg(E_Jtarg),.E_PC4(E_PC4),.E_busA(E_busA),.E_busB(E_busB),.E_immd(E_immd),.E_func(E_func),.E_Rt(E_Rt),.E_Rd(E_Rd),.E_Rs(E_Rs),
	.E_ExtOp(E_ExtOp),.E_ALUSrc(E_ALUSrc),.E_RegDst(E_RegDst),.E_ALUOp(E_ALUOp),.E_R_type(E_R_type),.E_MemWr(E_MemWr),.E_Jump(E_Jump),
	.E_Branch(E_Branch),.E_MemtoReg(E_MemtoReg),.E_RegWr(E_RegWr));
	
	wire[31:0]Extout;
	Ext ext(.imm16(E_immd),.ExtOp(E_ExtOp),.Extout(Extout));
	
	wire[2:0]ALUctr1;
	ControlUnit_ALU ctrlunitALU(.func(E_func),.ALUctr(ALUctr1));
	
	wire[4:0]E_Rw;
	MUX5_2_1 mux5_2_1(.X1(E_Rd),.X0(E_Rt),.S(E_RegDst),.Y(E_Rw));
	
	wire[2:0]ALUctr;
	MUX3_2_1 mux3_2_1(.X1(ALUctr1),.X0(E_ALUOp),.S(E_R_type),.Y(ALUctr));
	
	wire E_Zero,E_Overflow;
	wire[31:0]Data_A,Data_B;//实验4新增
	ALU alu(.X(Data_A),.Y(Data_B),.ALUctr(ALUctr),.R(E_ALUout),.Overflow(E_Overflow),.Zero(E_Zero));
	
	wire[31:0]Adder32_A,E_Btarg;
	assign Adder32_A=Extout<<2;
	Adder32 adder32(.A(Adder32_A),.B(E_PC4),.Cin(1'b0),.F(E_Btarg));
	
	wire M_Zero,M_Overflow,M_MemWr,M_Jump,M_Branch,M_MemtoReg,M_RegWr;
	wire[31:0]M_Btarg,M_Jtarg,M_busB;
	wire[4:0]M_Rw;
	wire not_out3;//实验5新增
	Ex_Mem ex_mem(.CLK(CLK),.Clrn(not_out3),.E_Jtarg(E_Jtarg),.E_Btarg(E_Btarg),.E_Zero(E_Zero),.E_Overflow(E_Overflow),.E_ALUout(E_ALUout),.E_busB(E_busB),.E_Rw(E_Rw), 
	.E_MemWr(E_MemWr),.E_Jump(E_Jump),.E_Branch(E_Branch),.E_MemtoReg(E_MemtoReg),.E_RegWr(E_RegWr),.M_Btarg(M_Btarg),.M_Jtarg(M_Jtarg),.M_Zero(M_Zero),
	.M_busB(M_busB),.M_ALUout(M_ALUout),.M_Overflow(M_Overflow),.M_Rw(M_Rw),.M_MemWr(M_MemWr),.M_Jump(M_Jump),.M_Branch(M_Branch),.M_MemtoReg(M_MemtoReg),.M_RegWr(M_RegWr));
	
	wire [31:0]M_Dout;
	DataRAM dataram(.CLK(CLK),.DataIn(M_busB),.WE(M_MemWr),.Address(M_ALUout),.DataOut(M_Dout));
	
	wire[31:0]E_Btarg_or_Jtarg;
	MUX32_2_1 mux32_2_1_2(.X1(M_Btarg),.X0(M_Jtarg),.S(M_Branch),.Y(E_Btarg_or_Jtarg));
	
	wire and_out;
	assign and_out=M_Zero&M_Branch;
	
	wire E_PCsrc;
	assign E_PCsrc=M_Jump|and_out;
	
	MUX32_2_1 mux32_2_1_3(.X1(E_Btarg_or_Jtarg),.X0(I_PC4),.S(E_PCsrc),.Y(PCin));

	wire W_Overflow,W_MemtoReg,W_RegWr;
	wire [31:0]W_Dout,W_ALUout;
	
	wire M_PCSrc,and_out_1,W_PCSrc;//实验5新增

	Mem_Wr mem_wr(.CLK(CLK),.M_Dout(M_Dout),.M_ALUout(M_ALUout),.M_MemtoReg(M_MemtoReg),.M_RegWr(M_RegWr),.M_Overflow(M_Overflow),
	.M_Rw(M_Rw),.M_PCSrc(M_PCSrc),.W_Overflow(W_Overflow),.W_Dout(W_Dout),.W_ALUout(W_ALUout),.W_Rw(W_Rw),.W_MemtoReg(W_MemtoReg),.W_RegWr(W_RegWr),.W_PCSrc(W_PCSrc));
	
	MUX32_2_1 mux32_2_1_4(.X1(W_Dout),.X0(W_ALUout),.S(W_MemtoReg),.Y(W_RegDin));
	
	wire not_out;//W_Overflow后面的非门
	assign not_out=~W_Overflow;
	
	assign W_RegWE=not_out&W_RegWr;
	
	
	//实验4新增代码
	wire [1:0]ALUSrcA,ALUSrcB;
	DetUnit detunit(.E_Rs(E_Rs),.E_Rt(E_Rt),.E_ALUSrc(E_ALUSrc),.M_Rw(M_Rw),.W_Rw(W_Rw),.M_RegWr(M_RegWr),.W_RegWr(W_RegWr),.ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB));
	
	
	MUX32_4_1 mux32_4_1_1(.in1(E_busA),.in2(M_ALUout),.in3(W_RegDin),.s(ALUSrcA),.out(Data_A));
	MUX32_4_1 mux32_4_1_2(.in1(E_busB),.in2(M_ALUout),.in3(W_RegDin),.in4(Extout),.s(ALUSrcB),.out(Data_B));
	
	wire load_use;
	DetUnit_load detunit_load(.E_MemtoReg(E_MemtoReg),.Rs(Rs),.Rt(Rt),.E_Rt(E_Rt),.load_use(load_use));
	
	assign not_out2=~load_use;
	
	
	//实验5新增
	assign and_out_1=M_Branch&M_Zero;
	assign M_PCSrc=and_out_1|M_Jump;
	assign not_out3=~M_PCSrc;
	
	assign or_out_not=~(load_use|M_PCSrc|W_PCSrc);
	
	
	
	
	

endmodule
