`include "P_C.v"
`include "Instrmem.v"
`include "reg_file.v"
`include "signext.v"
`include "ALU_flag.v"
`include "controlunit.v"
`include "data_mem.v"
`include "PC_adder.v"

module SCTop(clk,rst);
input clk, rst;

wire [31:0]PCtoIM,instrRD,RD1_top,Immext_top,ALUres_to_datamem,datamem_to_reg,adderto_pc ;
wire [2:0]ALUcontr;
wire regwrite;

P_C PC( .PC(PCtoIM),
        .PC_Next(adderto_pc),
        .rst(rst),
        .clk(clk)

);

Instruction_mem InMEM(.A(PCtoIM),
                        .rst(rst),
                        .RD(instrRD)

);

register_file regfile(.A2(),
                        .A1(instrRD[19:15]),
                        .A3(instrRD[11:7]),
                        .WE3(regwrite),
                        .WD3(datamem_to_reg),
                        .RD1(RD1_top),
                        .RD2(),
                        .rst(rst),
                        .clk(clk)

);

se signedext(.In(instrRD),
.ImmExt(Immext_top)

);

ALU ALU(.A(RD1_top),
        .B(Immext_top),
        .ALUcontrol(ALUcontr),
        .Ze(),
        .C(),
        .N(),
        .V(),
        .Res(ALUres_to_datamem)

);
cu_top controlunit(.op(instrRD[6:0]), //first 7 bits of instruction frm instr mem
                .funct3(instrRD[14:12]),
                .funct7(),
                .branch(),
                .Resrc(),
                .Memwrite(),
                .ALUsrc(),
                .Immsrc(),
                .Regwrite(regwrite),
                .ALUcontrol(ALUcontr)
);

data_mem datamemory(.A(ALUres_to_datamem),
                    .WD(),
                    .WE(),
                    .clk(clk),
                    .RD(datamem_to_reg),
                    .rst(rst)
);

PC_adder pcadder(.a(PCtoIM),
                .b(32'd4),
                .c(adderto_pc)
                );

endmodule