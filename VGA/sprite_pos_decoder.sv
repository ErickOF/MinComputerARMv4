module sprite_pos_decoder ( input [7:0] pos,
                            input visible,
                            output logic [9:0] x, y,
									 output logic visible_cond);

logic visible_temp;
logic [9:0] x_temp, y_temp;

always_comb
begin
case (pos)
    8'd0: begin visible_temp = 'b0; x_temp = 10'd0; y_temp = 10'd0; end
    8'd1: begin visible_temp = visible; x_temp = 10'd6; y_temp = 10'd51; end
    8'd2: begin visible_temp = visible; x_temp = 10'd42; y_temp = 10'd51; end
    8'd3: begin visible_temp = visible; x_temp = 10'd82; y_temp = 10'd51; end
    8'd4: begin visible_temp = visible; x_temp = 10'd122; y_temp = 10'd51; end
    8'd5: begin visible_temp = visible; x_temp = 10'd162; y_temp = 10'd51; end
    8'd6: begin visible_temp = visible; x_temp = 10'd202; y_temp = 10'd51; end
	 default: begin visible_temp = 'b0; x_temp = 10'd0; y_temp = 10'd0; end
endcase
end

assign x = x_temp;
assign y = y_temp;
assign visible_cond = visible_temp;

endmodule // sprite_pos_decoder