`include "cpu_3.v"

module cpu_3_tb();

  reg reset, clk;

  cpu_3 cpu_3_0(clk, reset);

  initial
    begin
      $dumpfile("cpu_3_tb.vcd");
      $dumpvars(0, cpu_3_tb);
      clk = 0;
      reset = 0;
      #55 reset = 1;
      #125000 $finish;
    end

  always #81 clk=~clk;

endmodule