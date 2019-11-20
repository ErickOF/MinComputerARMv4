module counter_test();
logic clk, reset;
reg [9:0] num;

//DUT initialization
counter DUT(clk, reset, num);

initial begin
	clk = 0;
	reset = 0;
	#10 reset = 1;
	#10 reset = 0;
end

always
begin
	#10 clk = ~clk;
	#1	$display("clk = %b, reset = %b, num = %b\n", clk, reset, num);
end

endmodule // counter_test
