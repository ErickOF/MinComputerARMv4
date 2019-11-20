module ALU #(parameter n=32)
				(input  logic [n-1:0] a, b,
				 input  logic [3:0]   ALUControl,
				 output logic [n-1:0] result,
				 output logic [3:0] NZCV);

logic 		  cout;
logic [n-1:0] result_and;
logic [n-1:0] result_or;
logic [n-1:0] result_xor;
logic [n-1:0] result_slr;
logic [n-1:0] result_sll;
logic [n-1:0] result_sar;
logic [n-1:0] result_sc;

logic Y_CB, NOT_S3, n1, n2;
logic [n-1:0] Result_Logic, Result_Arithmetic;

	  arithmeticALU #(n) arit(a, b, ALUControl[0], Y_CB, Result_Arithmetic);
	  
	  logicALU #(n) log(a, b, ALUControl[2:0], Result_Logic);
	  
	  mux2x1_nBits #(n) m1(Result_Arithmetic, Result_Logic, ALUControl[3],result);


not not1(NOT_S3, ALUControl[3]);
	  
	//Negative Flag
	assign NZCV[3] = result[n-1];
	  
	  //Zero Flag
	  assign NZCV[2] = (result == 0);
	  
	  //Carry
	  and and1(NZCV[1], Y_CB, NOT_S3);
	  
	  //oVerflow
	  xor xor1(n1, a[n-1], Result_Arithmetic[n-1]);
	  xnor xnor1(n2, a[n-1], b[n-1], ALUControl[0]);  
	  and and2(NZCV[0], n1, n2, NOT_S3);
	  
endmodule
