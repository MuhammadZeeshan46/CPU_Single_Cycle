module and_2(a, b, y);

  input a, b;
  output reg y;

  always @(a, b)
  begin
    y = a & b;
  end

endmodule