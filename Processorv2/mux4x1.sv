module mux4x1#(parameter bits = 8)(output logic [bits-1:0] Z,
											  input logic [bits-1:0] E0, E1, E2, E3,
											  input S1, S0);
	 
	logic n0, n1, n2, n3, NOT_S1, NOT_S0;
	
	not not1(NOT_S1, S1);
	not not2(NOT_S0, S0);
	
	and and1(n0, E0, NOT_S1, NOT_S0);
	and and2(n1, E1, NOT_S1, S0);
	and and3(n2, E2, S1, NOT_S0);
	and and4(n3, E3, S1, S0);
	
	or or1(Z, n0, n1, n2, n3);

endmodule