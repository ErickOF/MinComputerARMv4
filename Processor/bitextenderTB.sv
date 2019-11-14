module bitextenderTB();

	logic [23:0] immediate;
	logic [1:0] immSrc;
	logic [31:0] extImmc;

	bitextender uut(immediate,immSrc,extImmc);
	
	initial begin
	
	immediate = 24'b101010101010101010101010;
	
	immSrc = 2'b00; #10;
	
	immSrc = 2'b01; #10;
	
	immSrc = 2'b10; #10;
	
	end

endmodule