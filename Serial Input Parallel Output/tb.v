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
    repeat (1) begin
       #2 d_in = 1;
      #4 d_in = 0;
      #3 d_in = 0;
      #2 d_in = 1;
      
      #10 d_in = 0;
      #15 d_in = 1;
      #16 d_in = 0;
      //#5 rst = 0;
    end
    #40 $finish;
  end
endmodule
