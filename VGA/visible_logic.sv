module visible_logic(input xm, ym,
                    input [5:0] color,
                    output visible);

logic background;

// Esta en bg?
assign background = (color == 6'd0);
// si no es bg y no se pasa del sprite
assign visible = ~background && ~(xm | ym);

endmodule // visible_logic
