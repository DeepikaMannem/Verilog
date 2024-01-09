module tb;
  wire out;
  reg sl1, sl2, a, b, c, d, clk;
  mux_4x1 dut(.a(a),
              .b(b),
              .c(c),
              .d(d),
              .sl1(sl1),
              .sl2(sl2),
              .out(out),
              .clk(clk));
  always #2clk = ~clk;
  initial begin
    clk = 0;
    a = 3'd0;
    b = 3'd1;
    c = 3'd2;
    d = 3'd3;
    #4 {sl1, sl2} = 3'd2;
    #6 {sl1, sl2} = 3'd0;
    #9 {sl1, sl2} = 3'd1;
    #10 {sl1, sl2} = 3'd3;
    #6 {sl1, sl2} = 3'd0;
    #20 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
