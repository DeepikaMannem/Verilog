module tff(t, clk, rst, q, q_bar); 
  input wire t;
  input wire clk;
  input wire rst;
  output reg q, q_bar;
  always@(posedge clk) begin
    if(rst == 1) begin
      q = 0;
      q_bar = ~q;
    end
    else begin
      q = ~t;
      q_bar = ~q;
    end
   $monitor("Reset = %0d; t = %0b; q = %0b; q_bar = %0b", rst, t, q, q_bar);
  end
endmodule
