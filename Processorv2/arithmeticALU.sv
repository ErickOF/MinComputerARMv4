module arithmeticALU	#(parameter n = 32)(input logic [n-1:0] a, b,
													  input logic ALUControl,
													  output logic Y_CB,
													  output logic [n-1:0] Y);
	
	logic Cout, Bout;

	logic [n-1:0] result_sum, result_sub;
	logic [n-1:0] result_mux_not;
	
	fulladder fulladder_module (a,b, 1'b0, result_sum, Cout);
	
	Substractor_nBits #(n) sub(a, b, 1'b0, Bout, result_sub);
	
	mux2x1_nBits #(n) m1(result_sum, result_sub, ALUControl, Y);
	
	mux2x1_nBits #(1) m2(Cout, Bout, ALUControl, Y_CB);
	
endmodule
