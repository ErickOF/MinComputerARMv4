module mux_rd_select #(parameter N=32)
					       (input  logic [N-1:0] rdMem, rdKeyboard, rdBomb, rdEnemy,
					        input  logic [16:0]   address,
					        output logic [N-1:0] y);

logic [N-1:0] result;

always_comb begin
	case (address)
	   32'b100000000: result <= rdKeyboard;
		32'b100000100: result <= rdBomb;
		32'b100001000: result <= rdEnemy;
		default: result <= rdMem;
	endcase
end

assign y = result;

endmodule