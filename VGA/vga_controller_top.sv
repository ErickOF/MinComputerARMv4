module vga_controller_top (input clk, rst,
                           //input [31:0] pos_mem,
                           output logic vga_clk, vga_sync_n, vga_blank_n, vga_vs, vga_hs,
                           output logic [7:0] VGA_R, VGA_G, VGA_B);

logic [9:0] posx, posy;
logic [3:0] posIn;
logic vga_clk_t, ready;
logic [23:0] RGB_bomberman, RGB_bomb1, RGB_screen, RGB_bomb2, RGB_explosion, RGB_enemy, RGB;
logic screen_visible, bomberman_visible, bomb1_visible, bomb2_visible, enemy_visible, explosion_visible;

clock_divider clock_divider(clk, vga_clk_t);
vga_signal vga_signal(vga_clk_t, rst, vga_hs, vga_vs, vga_blank_n, vga_sync_n, posx, posy);

game_screen_printer game_screen_printer(.x(posx), .y(posy), .RGB(RGB_screen), .print(screen_visible));

bomberman_sprite_top bomberman_sprite_top(.clk(vga_clk_t), .pos(8'd1), 
                    .posx(posx), .posy(posy), .visible(bomberman_visible), .RGB(RGB_bomberman));

bomb1_sprite_top bomb1_sprite_top(.clk(vga_clk_t), .pos(8'd2),
                    .posx(posx), .posy(posy), .visible(bomb1_visible), .RGB(RGB_bomb1));

bomb2_sprite_top bomb2_sprite_top(.clk(vga_clk_t), .pos(8'd3), 
                    .posx(posx), .posy(posy), .visible(bomb2_visible), .RGB(RGB_bomb2));

enemy_sprite_top enemy_sprite_top(.clk(vga_clk_t), .pos(8'd4), 
                    .posx(posx), .posy(posy), .visible(enemy_visible), .RGB(RGB_enemy));
                    
explosion_sprite_top explosion_sprite_top(.clk(vga_clk_t), .pos(8'd5), 
                    .posx(posx), .posy(posy), .visible(explosion_visible), .RGB(RGB_explosion));

rgb_mux rgb_mux(.visible({explosion_visible,enemy_visible,bomb2_visible,bomb1_visible,bomberman_visible,screen_visible}), 
                .RGB6(RGB_explosion), 
                .RGB5(RGB_enemy), 
                .RGB4(RGB_bomb2), 
                .RGB3(RGB_bomb1), 
                .RGB2(RGB_bomberman),
                .RGB1(RGB_screen),
                .RGB(RGB));

assign vga_clk = vga_clk_t;
assign {VGA_R, VGA_G, VGA_B} = RGB;

endmodule // vga_controller_top
