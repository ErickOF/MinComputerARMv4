module vertical_counter(input logic clk,
								input logic rst,
								input logic new_line,
								output logic [9:0] count);
	parameter width = 480;
	parameter pulse = 2;
	parameter front_porch = 10;
	parameter back_porch = 33;
	parameter v_pol = 0;
	parameter v_total = pulse + back_porch + width + front_porch;
	logic [9:0] v_count = 10'd0;
	
	always_ff @(posedge clk) begin
		if(rst)
			v_count = 10'd0;
		else if(new_line) begin
			if(v_count < v_total - 1)
				v_count <= v_count + 10'd1;
			else
				v_count <= 10'd0;
			end
		end
	assign count = v_count;
endmodule
