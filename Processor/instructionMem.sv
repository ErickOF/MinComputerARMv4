module instructionMem(input logic[31:0]PC,
							 input clk,
							 output logic [31:0] instruction);

reg [31:0] ram [0:22];

	initial begin
		
		//$readmemh("C:/Users/...", ram);
		
	end
	
always @ (posedge clk)
	
	begin
	
		instruction = ram [PC[31:2]];
		
	end
	
endmodule
