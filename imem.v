module imem(s, y);

  input [31:0] s;
  output reg [31:0] y;

  reg [7:0] imem [16380:0];

  initial 
  begin

    imem[0] = 'h00; imem[1] = 'h80; imem[2] = 'h30; imem[3] = 'h22; //LW
    imem[4] = 'h00; imem[5] = 'h0C; imem[6] = 'h00; imem[7] = 'h00; //ADD
    imem[8] = 'h00; imem[9] = 'h88; imem[10] = 'h10; imem[11] = 'h00; //ADD
    imem[12] = 'h01; imem[13] = 'h90; imem[14] = 'h00; imem[15] = 'h60; //BEQ
    imem[16] = 'h00; imem[17] = 'h00; imem[18] = 'h00; imem[19] = 'h62; //JUMP
    imem[20] = 'h00; imem[21] = 'h88; imem[22] = 'h10; imem[23] = 'h00; //ADD (To see if we exit loop)
  end

  always @(s)
  begin
    #40
    y = {imem[s+3], imem[s+2], imem[s+1], imem[s]};
  end

endmodule