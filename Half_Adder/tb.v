module tb;
  reg a, b;
  wire s, c;
  half_adder ha1(.a(a),
                 .b(b),
                 .c(c),
                 .s(s));
  initial begin
    a = 0;
    b = 0;
  $monitor("a = %0b, b = %0b, s = %0b, c = %0b", a, b, s, c);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  initial begin
	#10 a = 1; b = 0;
	#15
	a = 1;b = 1;
	#20
	a = 1; b = 0;
    #100
    $finish;
  end
endmodule

