module register(input  logic       clk, we,
				   input  logic [31:0] wd,
				   output logic [31:0] rd);

logic [31:0] mem;

assign rd = mem; // word aligned

always_ff @(negedge clk)
	if (we) mem <= wd;

endmodule // register