module regbomb(input  logic        clk, we,
				   input  logic [31:0] address, wd,
				   output logic [31:0] rd);

logic [31:0] mem[3:0];

assign rd = mem[address[31:2]]; // word aligned

always_ff @(posedge clk)
	if (we) mem[address[31:2]] <= wd;

endmodule // register