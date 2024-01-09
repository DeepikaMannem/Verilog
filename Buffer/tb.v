 module tb;
  reg a;
  wire y;
  reg clk;
  buffer dut(.a(a),
               .y (y),
               .clk (clk));
  initial begin
    a = 0;
    clk = 0;
    #5 a = 1;
    #7 a = 0;
    #8 a = 1;
    #10 a = 0;
    #30 $finish;
  end
  always #2clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
