module tb;
  reg clk, rst, d_in;
  wire [3:0] d_out;
  sipo sipo1(clk, rst, d_in, d_out);
  always #2 clk = ~clk;
  initial begin
    $dumpvars(1);
    $dumpfile("dump.vcd");
    clk = 0; rst = 0; d_in = 0;
  end
  initial begin
    #2 rst = 1;
    #3 rst = 0;    
    repeat (1) begin
      #2 d_in = 1;
      #2 d_in = 1;
      #2 d_in = 0;
      #2 d_in = 1;
      #2 d_in = 0;
      #4 d_in = 1;
      #5 rst = 1;
    end
    #30 $finish;
  end
endmodule
