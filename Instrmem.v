module Instruction_mem(A,rst,RD);
input [31:0]A;
input rst;
output [31:0]RD;

reg [31:0] Mem [1023:0];//u hv 1024 regs of size 32 bits so u r basically inputting a row index u get a column

assign RD=(rst==1'b0)?32'h00000000:Mem[A[31:2]];

endmodule