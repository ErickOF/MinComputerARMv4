module datapath (
	input logic clk,reset,
	input logic [1:0] RegSrc,
	input logic RegWrite,
	input logic [1:0] ImmSrc,
	input logic ALUSrc,
	input logic [3:0] ALUControl,
	input logic MemtoReg,
	input logic PCSrc,
	output logic [3:0] ALUFlags,
	input logic [31:0] PC,
	input logic [31:0] Instr,
	output logic [31:0] ALUResult, WriteData,
	input logic [31:0] ReadData
	);
	
	logic [31:0] PCNext, PCPlus4, PCPlus8;
	logic [31:0] ExtImm, SrcA, SrcB, Result;
	logic [3:0] RA1,RA2;
	
	//PC logic
	mux2x1_nBits #(32) pcmux(PCNext, PCPlus4, Result, PCSrc);
	FlipFlop #(32) pcreg(PCNext, clk, reset, 1'b1 ,PC);
	
	logic c1,c2;
	
	fulladder #(32) pcadd1(c1, PCPlus4, 1'b0 ,PC, 32'b100);
	fulladder #(32) pcadd2(c2, PCPlus8, 1'b0 ,PCPlus4, 32'b100);
	
	//Register file logic
	mux2x1_nBits #(4) ra1mux(RA1, Instr[19:16] , 4'b1111 , RegSrc[0] );
	mux2x1_nBits #(4) ra2mux(RA2, Instr[3:0] , Instr[15:12] , RegSrc[1] );
	
	
	bankReg rf(RA1,RA2,Instr[15:12], Result, PCPlus8, clk, RegWrite, reset, SrcA, WriteData);
	mux2x1_nBits #(32) resmux(Result, ALUResult , ReadData , MemtoReg );
	
	bitextender ext(Instr[23:0], ImmSrc, ExtImm);
	
	//ALU logic
	
	mux2x1_nBits #(32) srcbmux(SrcB , WriteData , ExtImm, ALUSrc );
	ALU #(32) alu(ALUFlags, ALUResult, SrcA, SrcB, ALUControl);
endmodule