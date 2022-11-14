`include "flipflop_32.v"
`include "adder_32.v"
`include "imem.v"
`include "control.v"
`include "alu.v"
`include "rmem.v"
`include "multiplexer_5_2.v"
`include "sign-extend_32.v"
`include "multiplexer_32_2.v"
`include "dmem.v"
`include "or_2.v"
`include "shift_left_2_32_32.v"
`include "shift_left_2_25_27.v"
`include "and_2.v"

module cpu_3(clk, reset);

  input clk, reset;
  wire [31:0] Q, D, instr, RA, RB, RB2, res, extended, extendedtoMux, ReadData, WriteData, shifted, pc4, pc4shifted, pc4orBranch;
  wire [26:0] instrShifted;
  wire [3:0] ALUControl;
  wire RegWrite, ALUSrc, MemWriteB, MemWriteW, MemReadB, MemReadW, MemtoReg, Wtype, Branch, Zero, BranchAndZero, Jump;
  wire[4:0] R2;

  flipflop_32 flipflop_32_0(Q, D, clk, reset);
  adder_32 adder_32_0(Q, 4, pc4);
  shift_left_2_25_27 shift_left_2_25_27_0(instr[24:0], instrShifted);
  imem imem_0(Q, instr);
  multiplexer_5_2 multiplexer_5_0(instr[14:10], instr[24:20], Wtype, R2);
  rmem rmem_0(instr[19:15], R2, instr[24:20], RegWrite, WriteData, clk, RA, RB);
  control control_0(instr[31:25], ALUControl, RegWrite, ALUSrc, MemWriteB, MemWriteW, MemReadB, MemReadW, MemtoReg, Branch, Jump);
  or_2 or_2_0(MemWriteB, MemWriteW, Wtype);
  signextend_32 signextend_32_0(instr, extended);
  shift_left_2_32_32 shift_left_2_32_32_0(extended, shifted);
  adder_32 adder_32_1(pc4, shifted, pc4shifted);
  and_2 and_2_0(Branch, Zero, BranchAndZero);
  multiplexer_32_2 multiplexer_32_2_2(pc4, pc4shifted, BranchAndZero, pc4orBranch);
  multiplexer_32_2 multiplexer_32_2_3(pc4orBranch, {pc4[31:27], instrShifted[26:0]}, Jump, D);
  multiplexer_32_2 multiplexer_32_2_0(RB, extended, ALUSrc, RB2);
  alu alu_0(RA, RB2, ALUControl, res, Zero);
  dmem dmem_0(res, RB, MemWriteB, MemWriteW, MemReadB, MemReadW, clk, ReadData);
  multiplexer_32_2 multiplexer_32_2_1(res, ReadData, MemtoReg, WriteData);

endmodule