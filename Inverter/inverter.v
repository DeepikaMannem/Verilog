module inverter(a, y);
  input wire a;
  output reg y;
  assign y = ~a;
endmodule
