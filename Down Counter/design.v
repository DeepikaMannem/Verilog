module pedge(input bit clk, rst, output reg [3:0]count);
 reg [3:0] count_down = 0;
  always@(posedge clk) begin
    if (rst | count_down == 0) begin
      count_down <= 4'b1111;
    end else begin
       count_down <= count_down - 1;
    end
    $display("counter = %0d", count_down);
  end
  assign count = count_down;
endmodule
