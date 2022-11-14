module adder_32(a, b, sum);

  input [31:0]a, b;
  output reg [31:0]sum;

  always @(a,b)
  begin
    #5 sum = a + b;
  end

endmodule