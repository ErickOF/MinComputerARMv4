module rgb_mux( input logic [5:0] visible,
            	input [23:0] RGB6, RGB5, RGB4, RGB3, RGB2, RGB1,
				output [23:0] RGB);

logic [23:0] RGB_output;

always_comb
begin
	case (visible)
		6'b000001: RGB_output = RGB3;
		6'b000010: RGB_output = RGB2;
		6'b000100: RGB_output = RGB1;
		6'b001000: RGB_output = RGB4;
		6'b010000: RGB_output = RGB4;
		6'b100000: RGB_output = RGB4;
	   default: RGB_output = 24'hFFFFFF;
	endcase
end

assign RGB = RGB_output;

endmodule // rgb_mux
