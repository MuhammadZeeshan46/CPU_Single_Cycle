module dmem(address, WriteData, MemWriteB, MemWriteW, MemReadB, MemReadW, clk, ReadData);

  input [31:0] address, WriteData;
  input MemWriteB, MemWriteW, MemReadB, MemReadW, clk;
  output reg [31:0] ReadData;

  integer i;

  reg [7:0] dd [16380:0];
  reg [7:0] dq [16380:0];

  initial 
  begin
    for (i = 0; i < 512; i = i + 4)
    begin
      dd[i] = 'h01;
      dd[i+1] = 'h00;
      dd[i+2] = 'h00;
      dd[i+3] = 'h00;
    end
  end

  always @(posedge clk)
  begin
    for (i = 0; i < 512; i = i + 4)
    begin
      dq[i] = dd[i];
      dq[i+1] = dd[i+1];
      dq[i+2] = dd[i+2];
      dq[i+3] = dd[i+3];
    end
  end

  always @(address, WriteData, MemWriteB, MemWriteW, MemReadB, MemReadW)
  begin
    #40
    if (MemWriteB == 1)
      dd[address] = WriteData[7:0];
    else if (MemWriteW == 1)
    begin
      dd[address] = WriteData[7:0];
      dd[address+1] = WriteData[15:8];
      dd[address+2] = WriteData[23:16];
      dd[address+3] = WriteData[31:24];
    end
    else if (MemReadB == 1)
      ReadData = $signed(dq[address]);
    else if (MemReadW == 1)
      ReadData = {dq[address+3], dq[address+2], dq[address+1], dq[address]};
  end
endmodule