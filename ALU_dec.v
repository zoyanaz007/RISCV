module ALU_dec(op,ALUop,funct3,funct7,ALUcontrol);
input [6:0]op;
input [1:0]ALUop;
input [2:0]funct3;
input [6:0]funct7;
output [2:0]ALUcontrol;

wire [1:0]concat;
assign concat={op[5],funct7[5]};
assign ALUcontrol=  (ALUop==2'b00)?3'b000:
                    (ALUop==2'b01)?3'b001:
                    ((ALUop==2'b10)&(funct3==3'b010))?3'b101:
                    ((ALUop==2'b10)&(funct3==3'b110))?3'b011:
                    ((ALUop==2'b10)&(funct3==3'b111))?3'b010:
                    ((ALUop==2'b10)&(funct3==3'b000)&(concat==2'b11))?3'b001:
                    ((ALUop==2'b10)&(funct3==3'b000)&(concat!=2'b11))?3'b000:
endmodule