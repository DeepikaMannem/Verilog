module mux_2x1(a, b, slt_line, clk, out);
  input a, b, slt_line;
  output reg out;
  input bit clk;
  always@(*) begin
    case (slt_line)
      0 : begin
        out <= a;
      end
      1 : begin
        out <= b;
      end
      endcase
  end
endmodule
