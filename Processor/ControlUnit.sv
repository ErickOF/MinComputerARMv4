module ControlUnit(input logic CLK, 
						 input logic Reset,
						 input logic [31:5] Instr,
						 input logic [3:0] ALUFlags,
						 output logic [1:0]RegSrc,
						 output logic RegWrite,
						 output logic [1:0] ImmSrc,
						 output logic ALUSrc,
						 output logic [3:0] ALUControl,
						 output logic MemWrite,
						 output logic MemtoReg,
						 output logic PCSrc);

	logic [1:0] FlagW;
	
	logic PCS, RegW, MemW, NoWrite;

	decoder dec(FlagW, PCS, RegW, MemW, MemtoReg, ALUSrc, ImmSrc, RegSrc, NoWrite, ALUControl, Instr[27:26],Instr[25:20],Instr[15:12], Instr[6:5]);

	condLogic cl(PCSrc,RegWrite,MemWrite,CLK,Reset,PCS,RegW,NoWrite,MemW,FlagW,Instr[31:28],ALUFlags);

endmodule
