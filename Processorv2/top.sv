module top (input logic clk, reset, data,
				output logic [31:0] WriteData, DataAdr,
				output logic MemWrite);
	
	logic [31:0] PC, Instr, ReadData, ReadDataEnemies, ReadDataBombs, ReadDataKey;
	logic enableMemory, enableBomb, enableEnemy, enablePointer, enableLifes, enableKey;
	logic [31:0] lifePosX, lifePosY, bombPosX,bombPosY, enemyPosX, enemyPosY;
	logic [7:0] code;

	ARMStruct arm(clk, reset, Instr, ReadData, PC, DataAdr, WriteData, MemWrite);
	
	instructionMem imem(PC, clk, Instr);
	
	addressingDecoder addrDeco(DataAdr, enableMemory, enablePointer, enableEnemy, enableBomb, enableLifes);
	
	dataMem deme(DataAdr, WriteData, enableMemory, MemWrite, clk, ReadData);
	
	//EnemiesRegister er(DataAdr, WriteData, enableEnemy, MemWrite, clk, ReadDataEnemies, enemyPosX, enemyPosY);
	
	//BombRegister br(DataAdr,WriteData,enableBomb, MemWrite, clk, ReadDataBombs, bombPosX, bombPosY);
	
	KeyboardRegister(DataAdr, WriteData, enableKey, MemWrite, clk, ReadDataKey);
	
	KeyboardDriver(clk, data, code);
	

endmodule

