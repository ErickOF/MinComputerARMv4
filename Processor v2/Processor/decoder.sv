module decoder	(input logic [1:0] Op,
					 input logic [5:0] Funct,
					 input logic [3:0] Rd,
					 input logic [1:0] sh,
					 output logic [1:0] FlagW,
					 output logic PCS, RegW, MemW, MemtoReg, ALUSrc,
					 output logic [1:0] ImmSrc, RegSrc, 
					 output logic NoWrite,
					 output logic [1:0] ALUControl);

	logic [9:0] controls;
	logic Branch, ALUOp;

	//---------------------------------------------------------------------------------------
	// Main Decoder
	//---------------------------------------------------------------------------------------
	always_comb
		case(Op)
			2'b00:
				//Funct[5] = 0 -> DP Reg
				//Funct[5] = 1 -> DP Imm
				
				if (Funct[5]==1) begin
					controls = 10'b0100100001;
				end
				else
					controls = 10'b0100000001;
					
			2'b01:
				//Funct[0] = 0 -> STR
				//Funct[0] = 1 -> LDR
				if (Funct[0]==1)begin
					controls = 10'b0101101000;
				end
				else
					controls = 10'b0010101100;
					
			2'b10:
				//B
				controls = 10'b1000110010;
			default:
				//Unimplemented
				controls = 10'bx;
		endcase	

	assign {MemW, MemtoReg, ALUSrc, Branch, RegW, ImmSrc, RegSrc, ALUOp} = controls;

	//DP Reg -> 0 1 0 0 0 XX 00 1 -> 10'b0100000001
	//DP Imm -> 0 1 0 0 1 00 X0 1 -> 10'b0100100001
	//STR    -> 0 0 1 X 1 01 10 0 -> 10'b0010101100
	//LDR    -> 0 1 0 1 1 01 X0 0 -> 10'b0101101000
	//B      -> 1 0 0 0 1 10 X1 0 -> 10'b1000110010

	//---------------------------------------------------------------------------------------
	// ALU Decoder
	//---------------------------------------------------------------------------------------
	always_comb
	
		if (ALUOp)begin
			case(Funct[4:1])
				4'b0100: ALUControl = 2'b00;		//ADD
				4'b0010: ALUControl = 2'b01;		//SUB
				4'b0000: ALUControl = 2'b10;		//AND
				4'b1100: ALUControl = 2'b11;		//OR
				/*
				4'b0001: ALUControl = 4'b1010; 		//XOR
				4'b1111: ALUControl = 4'b1011; 		//NOT
				4'b1101: ALUControl = {2'b11, sh};	//Shift
				4'b1000: ALUControl = 4'b1000;		//TST
				4'b1001: ALUControl = 4'b1010;		//TEQ
				4'b1010: ALUControl = 4'b0001;		//CMP
				4'b1011: ALUControl = 4'b0000;		//CMN
				*/
				default: ALUControl = 2'bx;			//Unimplemented
			endcase
			
			FlagW[1] = Funct[0];
			FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
			NoWrite = Funct[0] & (Funct[4:1] == 4'b00 | Funct[4:1] == 4'b1001 | Funct[4:1] == 4'b1010 | Funct[4:1] == 4'b1011);
		end
		
		else begin
			ALUControl = 2'b00;
			FlagW = 2'b00;
			NoWrite = 1'b0;
		end

	//---------------------------------------------------------------------------------------
	// PC Logic
	//---------------------------------------------------------------------------------------
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;

endmodule