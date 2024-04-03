module pipo (input wire clk, rst, [7:0] pi, output reg [7:0] po);
  always@(posedge clk) begin
    po <= pi;
  end
endmodule
