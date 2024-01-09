module tb;
  wire q, q_bar;
  reg t, clk, rst;
  
  tff tff1(.clk(clk),
           .rst(rst),
           .q(q),
           .t(t),
           .q_bar(q_bar));
  always #2 clk = ~clk;
  initial begin 
    clk = 0;
    rst = 0;
    t = 0;
  end 
  initial begin 
    #2 rst = 0;
    #4 t = 1;
    #1 rst = 1;
    #6 t = 0;
    #3 t = 1;
     #10$finish;
end
endmodule

