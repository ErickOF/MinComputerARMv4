module vertical_sync(input logic clk,
							input logic rst, 
							input logic [9:0] vcount, 
							output logic vsync);
	
	parameter width = 480;
	parameter pulse = 2;
	parameter front_porch = 10;
	parameter v_pol = 0;
	
	logic sync = v_pol;
	
	always_ff @(posedge clk)
		if (rst == 1)
			sync <= v_pol;
		else if (vcount < width + front_porch | vcount >= width + front_porch + pulse)
			sync <= ~v_pol;
		else
			sync <= v_pol;
	
	assign vsync = sync;
	
endmodule
