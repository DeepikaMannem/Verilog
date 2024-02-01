module dff (input wire clk, rst, d, output reg q);
  always @ (posedge clk) begin
    if(rst) begin
      q <= 0;
    end else begin
      q <= d;
    end
  end
endmodule

//D Flip Flop Module can be created separately

module sipo (input wire clk, rst, data_in, output reg [3:0] data_out);
  // Here we consider 4 flops that is 3 down to 0, 3rd flop would be the first flop
  dff dff1 (clk, rst, data_in, data_out[3]);
  dff dff2 (clk, rst, data_out[3], data_out[2]);
  dff dff3 (clk, rst, data_out[2], data_out[1]);
  dff dff4 (clk, rst, data_out[1], data_out[0]);
  always@(*) begin
    $display ("time = %1d, rst = %1d, data_in = %1d, data_out = %1d", $time, rst, data_in, data_out);
  end
endmodule
      
