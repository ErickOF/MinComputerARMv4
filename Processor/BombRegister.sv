module BombRegister(
	input [31:0] A, WD,
	input  oe, we, clock,
	output logic [31:0] RD, RXpos, RYpos
	);

	logic [31:0] positions [0:1];

	
	assign RXpos = positions [0];
	assign RYpos = positions [1];
	
	assign RD = (oe==1'b0) ? 32'bz : positions[A[2]];
		
	always @ (posedge clock)
	begin
		if (we==1'b1 & oe==1'b1)
			positions[A[2]] = WD;
	end
	
endmodule