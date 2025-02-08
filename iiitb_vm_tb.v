module iiitb_vm_tb;

  //inputs
  reg clk;
  reg[1:0] in;
  reg rst;

  //output
  wire out;
  wire[1:0] change;
  iiitb_vm uut(
    .clock(clk),
    .reset(rst),
    .in(in),
    .out(out),
    .change(change)
  );

  initial begin
    //initialize inputs
    $dumpfile("iiitb_vm.vcd");
    $dumpvars(0,iiitb_vm_tb);
    rst = 0;
    clk = 0;
    in = 2'b00;
  
    // Apply test inputs
    #10 in = 2'b01; // Test input 1
    #10 in = 2'b10; // Test input 2
    #10 in = 2'b11; // Test input 3 (Edge case)
    #10 in = 2'b00; // Return to default state
  
    // Additional test cases
    #10 in = 2'b10;
    #10 in = 2'b01;
    #10 in = 2'b00;
    
    #20 $finish; // End simulation
  end
  always #5 clk = ~clk;
endmodule
