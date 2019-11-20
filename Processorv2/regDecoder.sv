module regDecoder(
	input clk,writeDataEn,
	input [3:0] regToWrite,
	output logic en0,en1,en2,en3,en4,en5,en6,en7,en8,en9,en10,en11,en12,en13,en14);
	
	always @(posedge clk)
	begin
			
		case(regToWrite)
			4'b0000:
			begin
				en0 = writeDataEn;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b0001:
			begin
				en0 = 1'b0;
				en1 = writeDataEn;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b0010:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = writeDataEn;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b0011:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = writeDataEn;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b0100:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = writeDataEn;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b0101:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = writeDataEn;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b0110:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = writeDataEn;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b0111:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = writeDataEn;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b1000:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = writeDataEn;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b1001:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = writeDataEn;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b1010:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = writeDataEn;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b1011:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = writeDataEn;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b1100:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = writeDataEn;
				en13 = 1'b0;
				en14 = 1'b0;
			end
			
			4'b1101:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = writeDataEn;
				en14 = 1'b0;
			end
			
			4'b1110:
			begin
				en0 = 1'b0;
				en1 = 1'b0;
				en2 = 1'b0;
				en3 = 1'b0;
				en4 = 1'b0;
				en5 = 1'b0;
				en6 = 1'b0;
				en7 = 1'b0;
				en8 = 1'b0;
				en9 = 1'b0;
				en10 = 1'b0;
				en11 = 1'b0;
				en12 = 1'b0;
				en13 = 1'b0;
				en14 = writeDataEn;
			end
			
		endcase
	end

endmodule