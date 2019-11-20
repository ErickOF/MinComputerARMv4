module datapath (
	input logic clk,reset,
	input logic [1:0] RegSrc,
	input logic RegWrite,
	input logic [1:0] ImmSrc,
	input logic ALUSrc,
	input logic [1:0] ALUControl,
	input logic MemtoReg,
	input logic PCSrc,
	output logic [3:0] ALUFlags,
	output logic [31:0] PC,
	input logic [31:0] Instr,
	output logic [31:0] ALUResult, WriteData,
	input logic [31:0] ReadData
	);
	
	logic [31:0] PCNext, PCPlus4, PCPlus8;
	logic [31:0] ExtImm, SrcA, SrcB, Result;
	logic [3:0] RA1,RA2;
	
	//PC logic
	mux2x1_nBits #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
	FlipFlop #(32) pcreg(PCNext, clk, reset, 1'b1 ,PC);
	
	logic c1,c2;
	
	fulladder #(32) pcadd1(PC, 32'b100, 1'b0, PCPlus4, c1);
	fulladder #(32) pcadd2(PCPlus4, 32'b100, 1'b0, PCPlus8, c2);
	
	//Register file logic
	mux2x1_nBits #(4) ra1mux(Instr[19:16], 4'b1111 , RegSrc[0], RA1);
	mux2x1_nBits #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);
	
	
	bankReg rf(RA1,RA2,Instr[15:12], Result, PCPlus8, clk, RegWrite, reset, SrcA, WriteData);
	mux2x1_nBits #(32) resmux(ALUResult, ReadData, MemtoReg, Result);
	
	bitextender ext(Instr[23:0], ImmSrc, ExtImm);
	
	//ALU logic
	
	mux2x1_nBits #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
	ALU #(32) alu(SrcA, SrcB, {2'b0, ALUControl}, ALUResult, ALUFlags);
endmodule
