module bankReg(input [3:0] A1, A2, A3,
					input [31:0] WD3,PCplus,
					input CLK, WriteEn, rst,
					output logic [31:0] RD1, RD2
	);
	
logic [31:0] rf [14:0];
	
always_ff@(posedge CLK)
	if (WriteEn) rf[A3]<= WD3;
		
assign RD1 = (A1 == 4'b1111)? PCplus : rf[A1];
assign RD2 = (A2 == 4'b1111)? PCplus : rf[A2];
				
endmodule