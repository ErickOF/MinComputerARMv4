module processor_testbench();

logic clk, reset, data;
logic [31:0] WriteData, DataAdr;
logic MemWrite;

processor dut(clk, clk, data, reset, WriteData, DataAdr, MemWrite);

initial begin
    reset <= 1;
	 #22;
	 reset <= 0;
end

always begin
    clk <= 1;
	 #5;
	 clk <= 0;
	 #5;
end

endmodule // processor_testbench
