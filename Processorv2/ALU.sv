module ALU #(parameter n=32)
				(input  logic [n-1:0] a, b,
				 input  logic [3:0]   ALUControl,
				 output logic [n-1:0] result,
				 output logic [3:0] NZCV);

logic 		  cout;
logic [n-1:0] result_and;
logic [n-1:0] result_or;
logic [n-1:0] result_xor;
logic [n-1:0] result_sum;
logic [n-1:0] result_mux_not;
logic [n-1:0] result_slr;
logic [n-1:0] result_sll;
logic [n-1:0] result_sar;
logic [n-1:0] result_sc;

logic Y_CB, NOT_S3, n1, n2;
logic [n-1:0] Y_Logic, Y_Arithmetic;

and_gate       and_module            (a, b, result_and);
or_gate        or_module             (a, b, result_or);
xor_gate       xor_module            (a, b, result_xor);
mux_not        mux_not_module        (b, ALUControl[0], result_mux_not);
fulladder      fulladder_module      (a, result_mux_not, ALUControl[0], result_sum, cout);
slr            slr_module            (a, b, result_slr);
sll            sll_module            (a, b, result_sll);
mux_result     mux_result_module     (result_and, result_or, result_xor, result_sum, result_slr, result_sll, result_sar, result_sc, ALUControl, result);
sar            sar_module            (a, b, result_sar);
sc             sc_module             (a, result_sc);

not not1(NOT_S3, ALUControl[3]);
//Negative Flag
assign NZCV[3] = result[n-1];
	  
//Zero Flag
assign NZCV[2] = (result == 0);
	  
//Carry
and and1(NZCV[1], Y_CB, NOT_S3);
	  
//oVerflow
xor xor1(n1, a[bits-1], Y_Arithmetic[bits-1]);
xnor xnor1(n2, a[bits-1], b[bits-1], ALUControl[0]);  
and and2(NZCV[0], n1, n2, NOT_S3);
	  
endmodule
