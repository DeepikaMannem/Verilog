module tb;
  wire [3:0] count;
  reg clk, rst;
  reg up_down;
  pedge dut (.clk(clk), .rst(rst), .up_down(up_down),
             .count(count));
  initial begin
    clk = 0; rst = 0; 
    up_down = 0;
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #10 up_down = 0;
    #20 up_down = 1;
    #50 rst = 1;
    #5 rst = 0;
    #100 $finish;
  end
  always #2 clk = ~clk;
endmodule
