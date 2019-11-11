module FlipFlop #(parameter N=1)(input logic [N-1:0] data,
											input logic clk, reset,load,
											output logic [N-1:0] q);
	 	 
	always_ff@(negedge clk, posedge reset)
	
		if(reset)
		begin
			q = 0;
		end
		else if(load)
		begin
			q = data;
		end
						 
endmodule