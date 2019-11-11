module condCheck(input logic [3:0] Cond, Flags,
					  output logic CondEx);

	logic Neg, Zero, Carry, OvF, ge;

	assign {Neg, Zero, Carry, OvF} = Flags;
	assign ge = (Neg == OvF);

	always_comb 
	
		case(Cond) 
			4'b0000: CondEx = Zero; 				//EQ
			4'b0001: CondEx = ~Zero; 				//NE
			4'b0010: CondEx = Carry; 				//CS
			4'b0011: CondEx = ~Carry; 				//CC
			4'b0100: CondEx = Neg; 					//MI
			4'b0101: CondEx = ~Neg; 				//PL
			4'b0110: CondEx = OvF; 					//VS
			4'b0111: CondEx = ~OvF; 				//VC
			4'b1000: CondEx = Carry & ~Zero; 	//HI
			4'b1001: CondEx = ~(Carry & ~Zero);	//LS
			4'b1010: CondEx = ge; 					//GE
			4'b1011: CondEx = ~ge; 					//LT
			4'b1100: CondEx = ~Zero & ge; 		//GT
			4'b1101: CondEx = ~(~Zero & ge); 	//LE
			4'b1110: CondEx = 1'b1; 				//ALWAYS (or none)
			default: CondEx = 1'bx; 				//Undefined
		endcase

endmodule
