module tb; 
  parameter DATA_WIDTH = 15, ADDR_WIDTH = 16;
  bit clk;
  reg rst, wr_en, rd_en;
  reg [DATA_WIDTH-1:0]data_in;
  wire [DATA_WIDTH-1:0] data_out;
  fifo fifo_inst (.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en), .data_in(data_in), .data_out(data_out));
  initial begin
    clk = 0; rst = 0; wr_en = 0; rd_en = 0;
  end
  always #2 clk = ~clk;
 initial begin
   #2 rst = 1;
   #1 rst = 0;
   repeat(15) begin
   #2 wr_en = 1; data_in = $random;
   #2 wr_en = 0; 
   end
   repeat(5) begin
   	#2 rd_en = 1;
   	#2 rd_en = 0;
   end
   #50 $finish();
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
