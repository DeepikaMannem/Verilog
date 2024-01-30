module tb;
  reg data_in, clk, rst;
  wire data_out;
  siso siso1 (data_in, clk, rst, data_out);
  initial begin
    clk = 0; rst = 1; data_in = 0;
    $dumpvars(1);
    $dumpfile("deepu.vcd");
  end
  initial begin
    repeat(15) begin
      @(negedge clk) data_in = $random;
    end
    #4 rst = 0; 
    repeat(5) begin
      @(negedge clk) data_in = $random;
    end
    #5 rst = 1;
    repeat(5) begin
      @(negedge clk) data_in = $random;
    end
    #40 $finish;
  end
  always #2 clk = ~clk;
endmodule
  
