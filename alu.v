module alu(a, b, ALUControl, res, Zero);

  input [31:0] a, b;
  input [3:0] ALUControl;
  output reg [31:0] res;
  output Zero;

  reg [31:0] opaa, opab, opba, opbb, opca, opcb;

  always @(ALUControl, a, b)
  begin
    if (ALUControl == 0)
    begin
      res <= #40 a + b;
    end
    else if (ALUControl == 1)
    begin
      res <= #40 a - b;
    end
    else if (ALUControl ==2)
    begin
    res <= #40 a * b;
    end
  end

  assign Zero = (a == b);

endmodule
