/*
Sprite Printer Module

Inputs:
    xcurrent: Current pixel x
    ycurrent: Current pixel y
	 xsprite: Pixel x where sprite is drawn
    ysprite: Pixel y where sprite is drawn

Outputs:
    R, G, B: RGB colors
    print: signal to indicate if sprite will be drawn
*/
module bomb1_sprite_top (input  clk, pos,
                        input  logic [9:0]  posx, posy,
						output logic visible,
						output logic [23:0] RGB);
// Sprite
logic [9:0] address, pixelx, pixely;
logic [5:0] color;
logic visible_temp;
// Sprite
rom_bomb1 rom_bomb1 (address, clk, color);
// 
color_decoder color_decoder (color, RGB);
sprite_pos_decoder sprite_pos_decoder(.pos(pos), .visible(visible_temp), .x(pixelx), .y(pixely), .visible_cond(visible));
logic xm63, ym63;
offset_address offset_address(pixelx, pixely, posx, posy, xm63, ym63, address);
visible_logic visible_logic(xm63, ym63, color, visible_temp);

endmodule // bomb1_sprite_top
