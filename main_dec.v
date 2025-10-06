module maindec(op,MemWrite,RegWrite,ALUSrc,resultsrc,immsrc,ALUop,branch);
//input Zero;
input [6:0]op;
output MemWrite,RegWrite,ALUSrc,resultsrc;
output [1:0]immsrc,ALUop;

output branch;
assign RegWrite=((op==7'b0000011)|(op==7'b0110011))?1'b1:1'b0;
assign MemWrite=(op==7'b0100011)?1'b1:1'b0;
assign ALUSrc=((op==7'b0000011)|(op==7'b0100011))?1'b1:1'b0;
assign resultsrc=(op==7'b0000011)?1'b1:1'b0;
assign immsrc=(op==7'b0100011)?2'b01:(op==7'b1100011)?2'b10:2'b00;
assign ALUop=(op==7'b0110011)?2'b10:(op==7'b1100011)?2'b01:2'b00;
assign branch=(op==7'b1100011)?1'b1:1'b0;
//assign PCSrc=Zero&branch;
endmodule