module Substractor_nBits #(parameter bits = 32)(input logic [bits-1:0] A, B,
																	input logic Bin,
																	 output logic Bout,
																	 output logic [bits-1:0] R);
	  
	logic [bits:0] borrows;
	assign borrows[0] = Bin;
	
	genvar i;
	generate
		for (i=0; i<bits; i++) begin: foorloop
			Substractor fs1( A[i], B[i],borrows[i],borrows[i+1], R[i]);
		end
	endgenerate
	
	assign Bout = borrows[bits];

endmodule