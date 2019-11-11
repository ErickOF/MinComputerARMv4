module bitextender(input [23:0] immediate,
						 input [1:0] immSrc,
						 output logic [31:0] extImmc);

	always_comb
	
		case(immSrc)
			2'b00: extImmc = {24'b0, immediate[7:0]};
			2'b01: extImmc = {20'b0, immediate[11:0]};
			2'b10: extImmc = {{6{immediate[23]}}, immediate[23:0], 2'b00};
			default: extImmc =32'bx;
		endcase

endmodule