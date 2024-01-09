module tb;
  wire y;
  reg clk, a;
  bufferby1clock dut(.y(y),
                     .a(a),
                     .clk(clk));
  initial begin
    a = 0;
    clk = 0;
    $monitor("a = %0b, y = %0b", a, y);
  end
  always #2 clk = ~clk;
  initial begin
    #4 a = 1;
    #7 a = 0;
    #8 a = 1;
    #20 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
