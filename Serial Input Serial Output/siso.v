module dff (input wire d, clk, rst, output reg q);
  always @(posedge clk) begin
    if(!rst) begin
      q <= 0;
    end else begin
      q <= d;
    end
  end
endmodule

module siso (input wire d_in, clk, rst, output reg d_out);
  wire w1, w2, w3;
  dff dff1 (d_in, clk, rst, w1);
  dff dff2 (w1, clk, rst, w2);
  dff dff3 (w2, clk, rst, w3);
  dff dff4 (w3, clk, rst, d_out);
endmodule
