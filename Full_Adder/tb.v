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
module tb;
  reg a, b, cin, clk;
  wire s, cz;
  half_adder ha1(.a(a),
                 .b(b),
                 .cz(cz),
                 .s(s),
                 .cin(cin),
                 .clk(clk));
  always #2 clk = ~clk;
  initial begin
    a = 0;
    b = 0;
    cin = 0;
    clk = 0;
    $monitor("a = %0b, b = %0b, cin = %0b, s = %0b, c = %0b", a, b, cin, s, cz);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  initial begin
	#2 a = 1; b = 1; cin = 1;
	#5 a = 1; b = 1; cin = 0;
	#8 a = 1; b = 0; cin = 1;
    #3 a = 1; b = 0; cin = 0;
    #5 a = 0; b = 1; cin = 1;
    #2 a = 0; b = 1; cin = 0;
    #5 a = 0; b = 0; cin = 1;
    #7 a = 0; b = 0; cin = 0;
    #50 $finish;
  end
endmodule

