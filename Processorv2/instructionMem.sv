module instructionMem(input logic[31:0]PC,
							 input clk,
							 output logic [31:0] instruction);

reg [31:0] ram [22:0];

initial begin

	$readmemh("C:/Users/ErickOF/Documents/Git/MinComputerARMv4/Processorv2/HEX.txt", ram);
	
end
	
always @ (posedge clk)
	
	begin
	
		instruction = ram [PC[31:2]];
		
	end
	
endmodule
