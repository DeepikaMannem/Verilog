module half_adder(a, b, s, c);
  input a;
  input b;
  output reg s;
  output reg c;
  assign s = a ^ b;
  assign c = a & b;
endmodule
