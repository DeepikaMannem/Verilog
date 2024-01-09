module bufferby2clock (a, clk, y);
  input wire a;
  input bit clk;
  output reg y;
  reg [3:0]count = 0;
  always@(posedge clk)begin
    count <= count + 1;
        if(count % 2 == 0)begin
          y <= a;
        end
  end
endmodule

Note: no need to use clock, used clock here only to make the output display properly
