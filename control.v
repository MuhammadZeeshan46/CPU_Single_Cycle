module control(instr, ALUControl, RegWrite, ALUSrc, MemWriteB, MemWriteW, MemReadB, MemReadW, MemtoReg, Branch, Jump);

  input[6:0] instr;
  output reg RegWrite, ALUSrc, MemWriteB, MemWriteW, MemReadB, MemReadW, MemtoReg, Branch, Jump;
  output reg [3:0] ALUControl;
  reg [6:0] aux;

  always @(instr)
  begin
    #10
    if (instr == 0) //ADD
    begin
      RegWrite = 1;
      ALUSrc = 0;
      MemWriteB = 0;
      MemWriteW = 0;
      MemtoReg = 0;
      ALUControl = 0;
      Branch = 0;
      Jump = 0;
    end
    else if (instr == 1) //SUB
    begin
      RegWrite = 1;
      ALUSrc = 0;
      MemWriteB = 0;
      MemWriteW = 0;
      MemtoReg = 0;
      ALUControl = 1;
      Branch = 0;
      Jump = 0;
    end
    else if (instr == 2) //MUL
    begin
      RegWrite = 1;
      ALUSrc = 0;
      MemWriteB = 0;
      MemWriteW = 0;
      MemtoReg = 0;
      ALUControl = 2;
      Branch = 0;
      Jump = 0;
    end
    else if (instr == 16) //LDB
    begin
      RegWrite = 1;
      ALUSrc = 1;
      MemReadB = 1;
      MemReadW = 0;
      MemWriteB = 0;
      MemWriteW = 0;
      MemtoReg = 1;
      ALUControl = 0;
      Branch = 0;
      Jump = 0;
    end
    else if (instr == 17) //LDW
    begin
      RegWrite = 1;
      ALUSrc = 1;
      MemReadB = 0;
      MemReadW = 1;
      MemWriteB = 0;
      MemWriteW = 0;
      MemtoReg = 1;
      ALUControl = 0;
      Branch = 0;
      Jump = 0;
    end
    else if (instr == 18) //STB
    begin
      RegWrite = 0;
      ALUSrc = 1;
      MemReadB = 0;
      MemReadW = 0;
      MemWriteB = 1;
      MemWriteW = 0;
      ALUControl = 0;
      Branch = 0;
      Jump = 0;
    end
    else if (instr == 19) //STW
    begin
      RegWrite = 0;
      ALUSrc = 1;
      MemReadB = 0;
      MemReadW = 0;
      MemWriteB = 0;
      MemWriteW = 1;
      ALUControl = 0;
      Branch = 0;
      Jump = 0;
    end
    else if (instr == 48) //BEQ
    begin
      RegWrite = 0;
      ALUSrc = 0;
      MemWriteB = 0;
      MemWriteW = 0;
      MemtoReg = 0;
      ALUControl = 1;
      Branch = 1;
      Jump = 0;
    end
    else if (instr == 49) //JUMP
    begin
      RegWrite = 0;
      MemWriteB = 0;
      MemWriteW = 0;
      Jump = 1;
    end
  end

endmodule
