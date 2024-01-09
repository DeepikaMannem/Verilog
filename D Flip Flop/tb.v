module tb;
  wire q, q_bar;
  reg clk, d, rst;
  dff dff_1 (.clk(clk),
             .d(d),
             .rst(rst),
             .q(q),
             .q_bar(q_bar));
  always #1 clk = ~clk;
  initial begin
    clk = 0;
    rst = 0;
    d = 0;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  initial begin
    #1 rst = 1;
    #1 d = 1;
    #1 rst = 0;
    #3 d = 0;
    #2 rst = 1;
    #2 d = 1;
    #1 d = 0;
    #1 $finish;
  end
endmodule

