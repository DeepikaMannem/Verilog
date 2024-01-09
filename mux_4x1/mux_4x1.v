module mux_4x1(a, b, c, d, sl1, sl2, clk, out);
  input a, b, c, d, sl1, sl2;
  output reg out;
  input bit clk;
  always@(*) begin
    case ({sl1, sl2})
      3'd0 : begin
        out <= a;
      end
      3'd1 : begin
        out <= b;
      end
      3'd2 : begin
        out <= c;
      end
      3'd3 : begin
        out <= d;
      end
    endcase
  end
endmodule
