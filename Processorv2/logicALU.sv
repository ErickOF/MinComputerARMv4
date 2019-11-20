module logicALU #(parameter n = 32)(input logic [n-1:0] a, b,
												input logic [2:0] ALUControl,
												output logic [n-1:0] result);

logic 		  cout;
logic [n-1:0] result_and;
logic [n-1:0] result_or;
logic [n-1:0] result_xor;
logic [n-1:0] result_slr;
logic [n-1:0] result_sll;
logic [n-1:0] result_sar;
logic [n-1:0] result_sc;
logic [n-1:0] result_mux_not;
logic [n-1:0] result_sum;


and_gate       and_module            (a, b, result_and);
or_gate        or_module             (a, b, result_or);
xor_gate       xor_module            (a, b, result_xor);
mux_not        mux_not_module        (b, ALUControl, result_mux_not);
slr            slr_module            (a, b, result_slr);
sll            sll_module            (a, b, result_sll);
sar            sar_module            (a, b, result_sar);
sc             sc_module             (a, result_sc);

mux_result     mux_result_module     (result_and, result_or, result_xor, result_sum, result_slr, result_sll, result_sar, result_sc, ALUControl, result);


endmodule


