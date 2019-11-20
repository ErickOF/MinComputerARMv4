module topTB();

	logic clk,reset,data;
	logic [31:0] WriteData, DataAdr, PC;
	logic MemWrite;
	
	
	top uut(clk, clk, reset, data, WriteData, DataAdr, PC, MemWrite);
	
	initial begin
	reset <=1; #22;
	reset <=0;
	end
	
	always begin
	clk <= 1;#5;
	clk <= 0;#5;
	end
	
	always @(negedge clk)
	begin
		if (MemWrite) begin
			if (DataAdr === 100 & WriteData === 7)begin
				$display ("Simulación exitosa");
				// $stop;
			end
			else if (DataAdr !== 96) begin
				$display ("Error en simulación");
				// $stop;
			end
		end
	end
	

endmodule
