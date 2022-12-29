module shift_left_2_32_32(a, shifted);

input [31:0] a;
output reg [31:0] shifted;

always @(a)
  begin
    shifted = a * 4;
  end 

endmodule
