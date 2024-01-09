module tb(y, a);
  output reg a;
  input wire y;
  inverter dut( .a(a),
               .y (y));
  initial begin
    a = 0;
    #5 a = 1;
    #7 a = 0;
    #8 a = 1;
    #10 a = 0;
    #50 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
