module dataMem(input [31:0] a, WD,
					input OEn, wEn, clock,
					output logic [31:0] RD);

	logic [31:0] ram [0:19];
	
	assign RD = (OEn==1'b0) ? 32'bz : ram[a[31:2]];
		
	always @ (posedge clock)
	begin
		if (wEn==1'b1 & OEn==1'b1)
			 ram [a[31:2]] = WD;
	end
	
endmodule