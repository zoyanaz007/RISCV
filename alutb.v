module alutb;
reg [31:0]A,B;
reg [2:0]ALUcontrol;
wire [31:0] Res;

ALU uut(
    .A(A),
    .B(B),
    .ALUcontrol(ALUcontrol),
    .Res(Res)
);
initial begin
    A=32'h21540987;
    B=32'h00000001;
    ALUcontrol=3'b001;
    #10 $finish;
end
endmodule