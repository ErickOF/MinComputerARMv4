module top (input logic clk, reset,
				output logic [31:0] WriteData, DataAdr,
				output logic MemWrite,
				output [7:0] VGA_R,VGA_G,VGA_B,
				output VGA_Clock, 
				output VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS);
	
	logic [31:0] PC, Instr, ReadData;
	logic enableMemory, enableBomb, enableEnemy;
	logic [31:0] lifePosX, lifePosY, bombPosX,bombPosY, enemyPosX,enemyPosY;	
	
	ARMStruct arm(clk, reset, Instr, ReadData, PC, DataAdr, WriteData, MemWrite);
	
	instructionMem imem(PC, clk, Instr);
	
	addressingDecoder addrDeco(DataAdr,enableMemory, enablePointer, enableDog, enableDuck);
	
	dataMem deme(DataAdr, WriteData, enableMemory, MemWrite, clk, ReadData);

endmodule
