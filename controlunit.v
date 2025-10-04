`include "main_dec.v"
`include "ALU_dec.v"

module cu_top(op,funct3,funct7,branch,Resrc,Memwrite,ALUsrc,Immsrc,Regwrite,ALUcontrol);
input [6:0]op,funct7;
input [2:0]funct3;
output branch,Resrc,Memwrite,ALUsrc,Regwrite;
output [1:0]Immsrc;
output [2:0]ALUcontrol;

wire [1:0]ALU_op;

maindec Main_dec(
                .op(op),
                .MemWrite(Memwrite),
                .RegWrite(Regwrite),
                .ALUSrc(ALUsrc),
                .resultsrc(Resrc),
                .immsrc(Immsrc),
                .ALUop(ALU_op),
                .branch(branch)
                );

ALU_dec ALUdecoder(.op(op),
        .ALUop(ALU_op),
        .funct3(funct3),
        .funct7(funct7),
        .ALUcontrol(ALUcontrol)

);
endmodule