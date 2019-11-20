module counter (input clk, reset,
                output logic [9:0] Q);

always_ff @(posedge clk, posedge reset)
begin
    if (reset) Q <= 10'b0;
    else Q <= Q + 10'b1;
end

endmodule // counter
