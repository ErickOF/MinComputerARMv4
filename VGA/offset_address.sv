module offset_address(input [9:0] pixelx, pixely, posx, posy,
                      output offsetX, offsetY,
                      output logic [9:0] address);

// Index X, index Y
logic [9:0] idx, idy;

// Number from 0 to 31
assign idx = pixelx - posx;
assign idy = pixely - posy;

// But only LSBs are needed 2^5
assign address = {idy[4:0], idx[4:0]};

assign offsetX = (idx > 10'd63 ? 1'b1 : 1'b0);
assign offsetY = (idy > 10'd63 ? 1'b1 : 1'b0);

endmodule // offset_address
