module tb;
wire o2;
reg i0, i1, i2, s0, s1, clk;
logic o1;
mux3_1 mux(.i0(i0), 
           .i1(i1), 
           .i2(i2), 
           .s0(s0), 
           .s1(s1), 
           .o1(o1),
           .clk(clk),
           .o2(o2));
initial begin
  i0 = 0; 
  i1 = 0; 
  i2 = 0; 
  s0 = 0; 
  s1 = 0;
  clk = 0;
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  always #2 clk = ~clk;
initial begin
  #2 i0 = 0; i1 = 0; i2 = 0; s0 = 0; s1 = 1;
  #3 i0 = 0; i1 = 1; i2 = 1; s0 = 1; s1 = 1; 
  #3 i0 = 1; i1 = 1; i2 = 0; s0 = 1; s1 = 1; 
  #3 i0 = 1; i1 = 0; i2 = 1; s0 = 1; s1 = 0; 
  #3 i0 = 0; i1 = 0; i2 = 0; s0 = 0; s1 = 1; 
  #3 i0 = 1; i1 = 0; i2 = 1; s0 = 1; s1 = 1; 
  #3 i0 = 1; i1 = 0; i2 = 0; s0 = 0; s1 = 0;
  #3 i0 = 1; i1 = 1; i2 = 1; s0 = 0; s1 = 1; 
  #50 $finish;
end
endmodule
