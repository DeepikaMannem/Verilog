module half_adder(a, b, clk, cin, s, cz);
  input wire a, clk;
  input wire b, cin;
  output reg s;
  output reg cz;
  always@(posedge clk) begin
    s <= cin ^ a ^ b;
    cz <= ((cin & b) | (a & b) | (a & cin));
    end
endmodule

//Note: no need to use clock, used clock here only to make the output display properly
