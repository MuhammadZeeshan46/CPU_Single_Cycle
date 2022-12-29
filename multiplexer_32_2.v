module multiplexer_32_2(a, b, s, y);

  input [31:0] a, b;
  input s;
  output reg [31:0] y;

  always @(a, b, s)
  begin
    #5 y = s ? b : a;
  end

endmodule