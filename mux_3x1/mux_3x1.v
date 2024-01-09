module mux2_1(input wire a, b, s, clk, output reg o);
  always@(posedge clk)begin
    case(s)
      0 :begin
        o <= a;
      end
      1 : begin
        o <= b;
      end
    endcase
    $display("a = %0b, b = %0b, s = %0b, o = %0b", a, b, s, o);
  end
endmodule

module mux3_1(input wire i0, i1, i2, s0, s1, clk, output reg o2, logic o1); 
  mux2_1 mux1(.a(i0),
              .b(i1),
              .s(s0),
              .o(o1),
              .clk(clk));
  mux2_1 mux2(.a(o1),
              .b(i2),
              .s(s1),
              .o(o2),
              .clk(clk));
endmodule

