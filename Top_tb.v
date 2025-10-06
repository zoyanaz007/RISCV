module single_cycle_top();
reg clk=1'b1,rst;

SCTop singlecycletop(
    .clk(clk),
    .rst(rst)
);

initial begin
    $dumpfile("gg.vcd");
    $dumpvars(0);
forever #5 clk=~clk;
end



initial begin
rst=1'b0; #50
rst=1'b1;#150
$finish;

end

endmodule