module mux2x1_nBits	#(parameter bits = 8)(input logic [bits-1:0] E0, E1,
														 input logic S,
														 output logic [bits-1:0] Z);


			assign Z = S ? E1 : E0;

endmodule
