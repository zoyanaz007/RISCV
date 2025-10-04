module se(In,ImmExt);

input [31:0]In;
output [31:0]ImmExt;

//signed extension
assign ImmExt = {{20{In[31]}}, In[31:20]};


endmodule