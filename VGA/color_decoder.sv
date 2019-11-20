// 0 - Fondo
// 1 - 0x000000 - black
// 2 - 0xffffff - white
// 3 - 0Xff0000 - red
// 4 - 0xffc9a1 - skin
// 5 - 0x0000ff - blue
// 6 - 0xfffd00 - yellow/belt
// 7 - 0xff0098 - pink
// 8 - 0x363636 - gray
// 9 - 0xd91818 - red/orange
// 10 - 0xd96518 - orange
// 11 - 0x220404 - black/red/mark
// 12 - 0x9f1212 - red/intern
// 13 - 0x4b0909 - black/red/extra
// 14 - 0x2acbc1 - blueish/enemy
// 15 - fda24a - orange/explosion
// 16 - fd6e44 - black/orange/explosion
// 17 - fffd74 - yellow/explosion
// 18 - fdd761 - blackish/yellow/explosion
// 19 - fffed2 - white/yellow

module color_decoder(input [5:0] color,
							output [23:0] RGB);
						  
always_comb
begin
	case (color)
		6'd0: RGB = 24'h000000;
		6'd1: RGB = 24'h000000;
		6'd2: RGB = 24'hFFFFFF;
		6'd3: RGB = 24'hFF0000;
		6'd4: RGB = 24'hFFC9A1;
		6'd5: RGB = 24'h0000FF;
		6'd6: RGB = 24'hFFFD00;
		6'd7: RGB = 24'hFF0098;
		6'd8: RGB = 24'h363636;
		6'd9: RGB = 24'hD91818;
		6'd10: RGB = 24'hD96518;
		6'd11: RGB = 24'h220404;
		6'd12: RGB = 24'h9F1212;
		6'd13: RGB = 24'h4B0909;
		6'd14: RGB = 24'h2ACBC1;
		6'd15: RGB = 24'hFDA24A;
		6'd16: RGB = 24'hFD6E44;
		6'd17: RGB = 24'hFFFD74;
		6'd18: RGB = 24'hFDD761;
		6'd19: RGB = 24'hFFFED2;
		default: RGB = 24'h000000;
	endcase
end

endmodule // color_decoder
