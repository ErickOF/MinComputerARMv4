module horizontal_counter(input logic clk,
								  input logic rst,
								  output logic new_line,
								  output logic [9:0] count);
	
	parameter width = 640;
	parameter pulse = 96;
	parameter front_porch = 16;
	parameter back_porch = 48;
	parameter h_pol = 0;
	parameter h_total = pulse + back_porch + width + front_porch;
	logic [9:0] h_count = 10'd0;
	logic line = 0;
	
	always_ff @(posedge clk) begin
		
		if(rst) begin
			h_count <= 10'd0;
			line <= 1;
			end
		else begin
			if(h_count < h_total - 1) begin
				h_count <= h_count + 10'd1;
				line <= 0;
				if(h_count == h_total - 2)
					line <= 1;
				end
			else begin
				h_count <= 10'd0;
				line <= 0;
				end
			end
		end
	assign new_line = line;
	assign count = h_count;

endmodule