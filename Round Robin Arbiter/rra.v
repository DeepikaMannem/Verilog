// round robin arbiter have equal priority for all the requests. So based on the turns the grant will be provided
module rra (input wire clk, rst, [3:0] req, output reg [3:0] granto);
  reg [3:0] present_state = 0;
  reg [3:0] next_state = 0;
  parameter [3:0] idle = 4'b0000;
  parameter [3:0] s0 = 4'b0001;
  parameter [3:0] s1 = 4'b0010;
  parameter [3:0] s2 = 4'b0100;
  parameter [3:0] s3 = 4'b1000;
  always@(posedge clk) begin
    if(rst) begin
      present_state <= idle;
    end else begin
      present_state <= next_state;
    end
  end
  always@(*) begin
    case (present_state)
      idle:
        if(rst) begin
          next_state <= idle;
        end else if (req[0]) begin
          next_state <= s0;
        end else if (req[1]) begin
          next_state <= s1;
        end else if (req[2]) begin
          next_state <= s2;
        end else if (req[3]) begin
          next_state <= s3;
        end else begin
          next_state <= idle;
        end
      s0 :
          if(rst) begin
            next_state <= idle;
          end else if (req[1]) begin
            next_state <= s1;
          end else if (req[2]) begin
            next_state <= s2;
          end else if (req[3]) begin
            next_state <= s3;
          end else begin
            next_state <= s0;
          end
      s1:
        if(rst) begin
            next_state <= idle;
        end else if (req[2]) begin
            next_state <= s2;
        end else if (req[3]) begin
            next_state <= s3;
        end else if (req[0]) begin
          next_state <= s0;
        end else begin
            next_state <= s1;
        end
      s2:
        if(rst) begin
            next_state <= idle;
        end else if (req[3]) begin
            next_state <= s3;
        end else if (req[0]) begin
            next_state <= s0;
        end else if (req[1]) begin
          next_state <= s1;
        end else begin
            next_state <= s2;
        end
      s3:
        if(rst) begin
            next_state <= idle;
        end else if (req[0]) begin
          next_state <= s0;
        end else if (req[1]) begin
          next_state <= s1;
        end else if (req[2]) begin
          next_state <= s2;
        end else begin
            next_state <= s3;
        end
    endcase
    $monitor ("state = %4b, req = %4b, grant = %4b", present_state, req, granto);
  end
  always @ (*) begin
    case(present_state)
      s0 : 
        granto = 4'b0001;
      s1 :
        granto = 4'b0010;
      s2 :
        granto = 4'b0100;
      s3 :
        granto = 4'b1000;
    endcase
  end
endmodule
