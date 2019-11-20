module imem(input  logic [31:0] a,
				output logic [31:0] rd);

logic [31:0] RAM[22:0];

initial begin
    $readmemh("C:/Users/ErickOF/Documents/Git/Single-Cycle-ARM-Processor/memfile.txt", RAM);
end

assign rd = RAM[a[31:2]];

endmodule // imem
