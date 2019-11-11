module addressingDecoder (input logic [31:0] Address,
								  output logic enableMemory, enablePointer, enableEnemies, enableBombs, enableLifes);
	
	assign enableMemory = (32'b0 <= Address & Address <= 32'b1111100111) ? 1'b1 : 1'b0;
	
	assign enablePointer = (32'd1000 <= Address & Address <= 32'd1004) ? 1'b1 : 1'b0;
	
	assign enableEnemies = (32'd1008 <= Address & Address <= 32'd1012) ? 1'b1 : 1'b0;
	
	assign enableLifes = (32'd1024 <= Address & Address <= 32'd1020) ? 1'b1 : 1'b0;
	
	assign enableBombs = (32'd1024 <= Address & Address <= 32'd1028) ? 1'b1 : 1'b0;


endmodule