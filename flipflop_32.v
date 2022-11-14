module flipflop_32(Q, D, clk, reset);

  input [31:0]D;
  input clk, reset;
  output reg [31:0]Q;

  reg [31:0] init;

  initial
  begin
    init = 0;
  end

  always @(posedge clk)
  begin
     #5 Q = init;
  end

  always @(D)
  begin
    #5 init = D;
  end

endmodule