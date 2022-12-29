module signextend_32(instr, extended);

  input [31:0] instr;
  output reg [31:0] extended;
  
  always @(instr)
   begin
     #5
     if (instr[31:25] ==16 || instr[31:25] == 17 || instr[31:25] == 18 || instr[31:25] == 19)
       extended = $signed(instr[14:0]);
     else if (instr[31:25] == 48)
       extended = $signed({instr[24:20], instr[9:0]});
   end
endmodule
