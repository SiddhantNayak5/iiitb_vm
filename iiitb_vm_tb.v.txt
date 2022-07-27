module vending_machine_tb;
//inputs
reg clk;
reg[1:0] in;
reg rst;
//output
wire out;
wire[1:0] change;
vending_machine_18105070 uut(
.clk(clk),
.rst(rst),
.in(in),
.out(out),
.change(change)
);
initial begin
//initialise inputs
$dumpfile("vending_machine_18105070.vcd");
$dumpvars(0,vending_machine_tb);
rst = 1;
clk = 0;
#6 rst = 0;
in = 2;
#19 in = 2;
#25 $finish;
end
always #5 clk = ~clk;
endmodule