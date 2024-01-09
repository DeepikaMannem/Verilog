module dff(d, clk, q, q_bar, rst);
  input d;
  input rst;
  input clk;
  output reg q;
  output reg q_bar;
  always @ (posedge clk) begin
    if(rst)begin
      q <= 0;
      q_bar = 0;
    end
    else begin
      q <= d;
      q_bar = ~q;
    end
    $display("Time = %0d, Reset = %0d, D = %0d, Q = %0d, Q_Bar = %0d", $time, rst, d, q, q_bar);
  end
endmodule
