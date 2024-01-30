module tb;
  reg clk;
  reg rst;
  reg [3:0] req;
  wire [3:0] granto;
  rra dut (.clk(clk), .rst(rst), .req(req), .granto(granto));
  initial begin
    clk = 0; rst = 0; req = 0;
  end
  initial begin
    $dumpvars(1);
    $dumpfile("deepu.vcd");
  end
  initial begin
     #4 req = 4'b1111;
     #8 req = 4'b0100;
     #2 req = 4'b1000;
     #4 req = 4'b1100;
     #6 req = 4'b0010;
     #2 req = 4'b1010;
    #10 $finish;
  end
    always #1 clk =~clk;
endmodule
