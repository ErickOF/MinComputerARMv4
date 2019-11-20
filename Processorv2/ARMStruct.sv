module ARMStruct(input logic clk, reset,
					  input logic [31:0] Instr, ReadData,
					  output logic [31:0] PC, ALUResult, WriteData,
					  output logic MemWrite);
	
	logic [3:0] ALUFlags;
	logic RegWrite, ALUSrc, MemtoReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc;
	logic [1:0] ALUControl;
	
	ControlUnit controller(clk, reset, Instr[31:5],ALUFlags, RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemWrite, MemtoReg, PCSrc);
	datapath Datapath(clk, reset, RegSrc, RegWrite,ImmSrc,ALUSrc, ALUControl, MemtoReg, PCSrc, ALUFlags, PC, Instr, ALUResult, WriteData, ReadData);

endmodule
