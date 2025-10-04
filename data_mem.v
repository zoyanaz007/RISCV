module data_mem(A,WD,WE,clk,RD);
input [31:0]A,WD;
input clk,WE;
output [31:0]RD;

reg [31:0] Data_MEM [1023:0];

assign RD=(WE==1'b1)?32'h00000000:Data_MEM[A];
always @(posedge clk)
begin 
if(WE)
begin
    Data_MEM[A]<=WD;
end
end
endmodule