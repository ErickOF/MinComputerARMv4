module horizontal_sync (input logic clk,
								input logic rst,
								input logic [9:0] hcount, 
								output logic hsync);
	
	parameter width = 640;
	parameter pulse = 96;
	parameter front_porch = 16;
	parameter h_pol = 0;
	
	logic sync = h_pol;
	
	always_ff @(posedge clk)
		if (rst == 1)
			sync <= h_pol;
		else if (hcount < width + front_porch | hcount >= width + front_porch + pulse)
			sync <= ~h_pol;
		else
			sync <= h_pol;
	
	assign hsync = sync;
	
endmodule 