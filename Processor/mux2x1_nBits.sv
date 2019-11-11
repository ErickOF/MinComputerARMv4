module mux2x1_nBits	#(parameter bits = 32)(input logic [bits-1:0] E0, E1,
														  input logic S,
														  output logic [bits-1:0] Z);

	genvar i;
	generate

			mux2x1 m1(Z, E0, E1, S);

	endgenerate

endmodule