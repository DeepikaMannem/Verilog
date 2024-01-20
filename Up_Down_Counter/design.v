module pedge(input bit clk, rst, up_down, output reg [3:0]count);
 reg [3:0] up_down_count = 0;
  always@(posedge clk) begin
    if (rst) begin
      up_down_count <= 4'h0;
    end else if (~up_down) begin
       up_down_count <= up_down_count - 1;
    end else begin
       up_down_count <= up_down_count + 1;
    end
    $display("counter = %0d", up_down_count);
  end
  assign count = up_down_count;
endmodule
