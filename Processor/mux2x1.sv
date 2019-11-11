module mux2x1(input logic E0, E1, S,
				  output logic Z);
	 
	logic n0, n1, NOT_S;
	 
	not not1(NOT_S, S);
	 
	and and1(n0, E0, NOT_S);
	and and2(n1, E1, S);
	 
	or or1(Z, n0, n1);
	
endmodule