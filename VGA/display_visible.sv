module display_visible(input logic clk,
							  input logic rst,
							  input logic [9:0] hcount,
							  input logic [9:0] vcount,
							  output logic enable);
							  
	parameter hwidth = 640;
	parameter vwidth = 480;
	logic visible = 0;
	
	always_ff @(posedge clk) begin
		if (rst == 1)
			visible <= 0;
		else
			visible <= (hcount < hwidth) & (vcount < vwidth);
		end
	
	assign enable = visible;

endmodule 