//declare
//wires
//assignments
//first mux does the 2s complement
module ALU(A,B,ALUcontrol,Res);
input [31:0]A,B;
input [2:0]ALUcontrol;
output [31:0] Res;

//wires
wire [31:0]andout,orout,notb,mux1,adder,mainmux;


assign andout=A&B;
assign orout=A|B;
assign notb=~B;
assign mux1=(ALUcontrol[0]==1'b0)?B:notb;
assign adder=A+mux1+ALUcontrol[0];
assign mainmux= (ALUcontrol[1:0]==2'b00)?adder :
                (ALUcontrol[1:0]==2'b01)?adder :
                (ALUcontrol[1:0]==2'b10)?andout :orout;
assign  Res=mainmux;

endmodule