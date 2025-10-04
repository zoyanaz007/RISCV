`include "P_C.v"
`include "Instrmem.v"

module SCTop(clk,rst);
input clk, rst;

wire [31:0]PCtoIM ;

P_C PC( .PC(PCtoIM),
        .PC_Next(),
        .rst(rst),
        .clk(clk)

);

Instruction_mem InMEM(.A(PCtoIM),
                        .rst(rst),
                        .RD()

);
endmodule