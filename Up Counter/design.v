module pedge(input bit clk, rst, output reg [3:0]count);;
  always@(posedge clk) begin
    if(rst) begin
      count <= 0;
    end else if (count == 4'b1111) begin
       count <= 0;
   end else begin
       count <= count + 1;
end
    $display("counter = %0d", count);
  end
endmodule
