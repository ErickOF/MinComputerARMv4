module sc #(parameter N=32)
			  (input  logic [N-1:0] a,
			   output logic [N-1:0]   resul);

logic [N-1:0] b;
logic [N-1:0] r_sc;

always_comb begin
	b = a >> 2;
	r_sc = {a[N-2:0], b[0]};
end

assign resul = r_sc;
	
endmodule