/*
Game frame Printer Module

Inputs:
    x: Pixel x
    y: Pixel y

Outputs:
    R, G, B: RGB colors
    print: signal to indicate if the lines will be drawn
*/

module game_screen_printer(input  [9:0] x, y,
						  output [23:0] RGB,
						  output print);

// Verify (x, y) position to draw
logic print_x;
logic print_y;

assign print_x = (10'd0 < x && x < 10'd2) || 
                 (10'd38 < x && x < 10'd42) ||
                 (10'd78 < x && x < 10'd82) ||
                 (10'd118 < x && x < 10'd122) ||
                 (10'd158 < x && x < 10'd162) ||
                 (10'd198 < x && x < 10'd202) ||
                 (10'd238 < x && x < 10'd242) ||
                 (10'd278 < x && x < 10'd282) ||
                 (10'd318 < x && x < 10'd322) ||
                 (10'd358 < x && x < 10'd362) ||
                 (10'd398 < x && x < 10'd402) ||
                 (10'd438 < x && x < 10'd442) ||
                 (10'd478 < x && x < 10'd482) ||
                 (10'd518 < x && x < 10'd522) ||
                 (10'd558 < x && x < 10'd562) ||
                 (10'd598 < x && x < 10'd602) ||
                 (10'd638 < x && x < 10'd640);

assign print_y = (10'd50 < y && y < 10'd52) || 
                 (10'd84 < y && y < 10'd86) ||
                 (10'd118 < y && y < 10'd120) ||
                 (10'd152 < y && y < 10'd154) ||
                 (10'd186 < y && y < 10'd188) ||
                 (10'd220 < y && y < 10'd222) ||
                 (10'd252 < y && y < 10'd254) ||
                 (10'd286 < y && y < 10'd288) ||
                 (10'd320 < y && y < 10'd322) ||
                 (10'd354 < y && y < 10'd356) ||
                 (10'd388 < y && y < 10'd390) ||
                 (10'd422 < y && y < 10'd424) ||
                 (10'd456 < y && y < 10'd458);

// Output signal
assign print = (print_x && y > 10'd52) || print_y;
// Pixel color
assign RGB = 24'b0;

endmodule // game_screen_printer
