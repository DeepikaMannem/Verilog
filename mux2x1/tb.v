module tb;
  wire out;
  reg a, b;
  reg slt, clk;
  mux_2x1 dut(.a(a),
              .b(b),
              .slt_line(slt),
              .out(out),
              .clk(clk));
  always #2clk = ~clk;
  initial begin
    a = 0; slt = 0; b = 1; clk = 0;
    #4 a = 0; slt = 0; b = 1;
    #6 a = 0; slt = 1; b = 1;
    #8 a = 0; slt = 0; b = 1;
    #9 a = 0; slt = 1; b = 1;
    #50 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
