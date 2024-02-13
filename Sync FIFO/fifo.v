module fifo #(parameter DATA_WIDTH = 15, parameter ADDR_WIDTH = 16)
  (input wire clk, rst, wr_en, rd_en, [15:0] data_in, output reg [15:0] data_out);
  reg [3:0] wr_ptr = 0;
  reg [3:0] rd_ptr = 0;
  reg full, empty;
  reg [DATA_WIDTH] mem [ADDR_WIDTH];
  always @ (posedge clk) begin
    if(rst) begin
      wr_ptr <= 0;
      rd_ptr <= 0;
      data_out <= 0;
    end else begin
      if (wr_en & (!full)) begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
      end else if (rd_en & (!empty)) begin
        data_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
      end
    end
  end
  assign full = (wr_ptr+1 == ADDR_WIDTH) ? 1 : 0;
  assign empty = (wr_ptr <= rd_ptr) ? 1 : 0;
endmodule
