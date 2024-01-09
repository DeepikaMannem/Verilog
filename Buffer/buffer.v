module buffer(a, clk, y);
  input wire a;
  input bit clk;
  output reg y;
  always@(posedge clk) begin
 	 y <= a;
  end
endmodule
