module tb;
  wire [3:0] count;
  reg clk, rst;
  pedge dut (.clk(clk), .rst(rst),
             .count(count));
  initial begin
    clk = 0; rst = 0;
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #10 rst = 1;
    #5 rst = 0;
    #100 $finish;
  end
  always #2 clk = ~clk;
endmodule
