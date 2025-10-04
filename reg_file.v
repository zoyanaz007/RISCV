module register_file(A2,A1,A3,WE3,rst,clk,WD3,RD1,RD2);
input [4:0]A1,A2,A3;
input WE3,clk,rst;
input [31:0]WD3;
output [31:0]RD1,RD2;

reg [31:0] registers [31:0]; //wherever address is used we need to introduce registers

assign RD1=(!rst)?32'h00000000:registers[A1];
assign RD2=(!rst)?32'h00000000:registers[A2];

always @(posedge clk) 
begin

if(WE3) 
begin 
    registers[A3]<=WD3;
end

end
endmodule