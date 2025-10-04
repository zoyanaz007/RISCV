module P_C(PC,PC_Next,rst,clk);
input [31:0]PC_Next;
output reg [31:0]PC; //output is a reg
input clk,rst;

always @(posedge clk)
begin

    if(rst==1'b0)
    begin
        PC<=32'h00000000;
    end
    else
    begin
        PC<=PC_Next;
    end
    
end
endmodule