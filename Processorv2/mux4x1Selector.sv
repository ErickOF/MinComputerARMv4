//module mux4x1Selector(input logic [19:0] DataAdr
//							 output [4:0] S);
//
//	
//	always_comb 
//	
//		case(DataAdr) 
//			6'h100000: CondEx = Zero; 				//EQ
//			20'b0001: CondEx = ~Zero; 				//NE
//			20'b0010: CondEx = Carry; 				//CS
//
//			default: CondEx = 1'bx; 				//Undefined
//		endcase
//	
//endmodule 