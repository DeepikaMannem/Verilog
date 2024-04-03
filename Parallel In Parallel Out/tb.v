module tb();
  reg clk, rst;
  reg [7:0] pi;
  wire [7:0] po;
  pipo po_in (clk, rst, pi, po);
  initial begin
    clk = 0; rst = 0;
    $dumpvars(1);
    $dumpfile("dump.vcd");
    #5 pi = 7'd67;
    #7 pi = 7'd7;
    #120 $finish;
  end
  always #2 clk = ~clk;
endmodule
