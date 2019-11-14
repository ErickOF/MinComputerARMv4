/*
Module to drive PS/2 keyboard

Inputs
   clk  - Clock
   data -
	rst  - Reset

Outpus
   direction - 
*/
module KeyboardDriver (input              clk, rst, data,
                       output logic [4:0] direction);

logic        rstTemp;
logic [7:0]  code;
logic [10:0] keyCode, previousCode;
logic        recordNext;
logic [11:0] count;

assign rstTemp    = 1;
assign recordNext = 0;
assign count = 0;

endmodule // KeyboardDriver
