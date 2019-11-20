module display_sync (input clk,
							input logic rst,
							input logic [9:0] hcount,
							input logic [9:0] vcount,
							output logic [9:0] posx,
							output logic [9:0] posy);
	
	parameter hwidth = 640;
	parameter vwidth = 480;
	logic [9:0] pixelx = 10'd0;
	logic [9:0] pixely = 10'd0;
	
	always_ff @(posedge clk) begin
		if(rst == 1) begin
			pixelx = 10'd0;
			pixely = 10'd0;
			end
		else begin
			if(hcount < hwidth)
				pixelx <= hcount;
			if(vcount < vwidth)
				pixely <= vcount;
			end
		end
		
	assign posx = pixelx;
	assign posy = pixely;
										
endmodule 