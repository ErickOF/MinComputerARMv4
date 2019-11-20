module dataMemTB();
	logic [31:0] A, WD;
	logic OE, wEnable, clock;
	logic [31:0] RD;

	dataMem uut(A, WD, OE, wEnable, clock, RD);
	
	initial begin
	
	A=32'b0;
	WD=32'b10;
	OE=1'b0;
	wEnable=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	OE=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	A=32'b100;
	WD=32'b100;
	OE=1'b0;
	wEnable=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	OE=1'b1;
	wEnable=1'b0;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	A=32'b1000;
	WD=32'b1000;
	OE=1'b1;
	wEnable=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	A=32'b0;
	WD=32'b1001;
	OE=1'b1;
	wEnable=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	A=32'b100;
	WD=32'b1010;
	OE=1'b1;
	wEnable=1'b0;
	clock=1'b0;#100;
	clock=1'b1;#100;
	
	OE=1'b1;
	wEnable=1'b1;
	clock=1'b0;#100;
	clock=1'b1;#100;

	end

endmodule