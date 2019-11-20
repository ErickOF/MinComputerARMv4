module processor(input logic         clk, ps2_clk, data, reset,
					  output logic [31:0] WriteData, DataAdr,
					  output logic        MemWrite);

logic [31:0] PC, Instr, ReadData, ReadDataMem, ReadDataBomb, ReadKeyboard,
             ReadDataEnemy, code32bits, WDBomb, WDEnemy, DataAdrTemp;
logic [7:0]  code;

// instantiate processor and memories
Arm       arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);

imem     InstMem(PC, Instr);
dmem     DataMem(clk, MemWrite, DataAdrTemp, WriteData, ReadData);

KeyboardController KC(ps2_clk, data, code);

assign code32bits = code;

register KeyboardReg(clk, MemWrite, code32bits, ReadDataEnemy);
register BombReg(clk, MemWrite, WDBomb, ReadDataEnemy);
register EnemyReg(clk, MemWrite, WDEnemy, ReadDataEnemy);

// mux_rd_select RdSelect(ReadDataMem, ReadKeyboard, ReadDataBomb, ReadDataEnemy, DataAdrTemp[16:0], ReadData);

assign DataAdr = DataAdrTemp;

endmodule // processor