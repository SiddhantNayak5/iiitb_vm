module iiitb_vm_tb;
//inputs
reg clk;
reg[1:0] in;
reg rst;
//output
wire out;
wire[1:0] change;
iiitb_vm uut(
.clk(clk),
.rst(rst),
.in(in),
.out(out),
.change(change)
);
initial begin
//initialise inputs
  $dumpfile("iiitb_vm.vcd");
  $dumpvars(0,iiitb_vm_tb);
rst = 1;
clk = 0;
#6 rst = 0;
in = 2;
#19 in = 2;
#25 $finish;
end
always #5 clk = ~clk;
endmodule
