//declare
//wires
//assignments
//first mux does the 2s complement
module ALU(A,B,ALUcontrol,Res,N,Ze,V,C);
input [31:0]A,B;
input [2:0]ALUcontrol;
output [31:0] Res;
output C,Ze,V,N;
//wires
wire [31:0]andout,orout,notb,mux1,adder,mainmux,slt;
wire cout,Xor,Xnor;


assign andout=A&B;
assign orout=A|B;
assign notb=~B;
assign mux1=(ALUcontrol[0]==1'b0)?B:notb;
assign {cout,adder}=A+mux1+ALUcontrol[0];


assign Ze=~(|Res);          //zero---NOR of result or inverted input AND
assign N=Res[31];
assign C=cout &(~ALUcontrol[1]);
assign Xor=adder[31]^A[31];
assign Xnor=~(ALUcontrol[0]^A[31]^B[31]);
assign V=ALUcontrol[1]&Xor&Xnor;
assign slt={31'b0000000000000000000000000000000,adder[31]};

assign mainmux= (ALUcontrol[2:0]==3'b000)?adder :
                (ALUcontrol[2:0]==3'b001)?adder :
                (ALUcontrol[2:0]==3'b010)?andout :
                (ALUcontrol[2:0]==3'b011)?orout:
                (ALUcontrol[2:0]==3'b101)?slt:32'h00000000;
assign Res=mainmux;

endmodule