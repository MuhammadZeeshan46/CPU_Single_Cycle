module rmem(ra, rb, WriteRegister, RegWrite, WriteData, clk, RA, RB);

  input [4:0] ra, rb, WriteRegister; 
  input RegWrite, clk;
  input [31:0] WriteData;
  output reg [31:0] RA, RB;

  //reg [31:0] rd [31:0];
  //reg [31:0] rq [31:0];
  reg [31:0] rd0, rd1, rd2, rd3, rd4, rd5, rq0, rq1, rq2, rq3, rq4, rq5;


  initial 
  begin
    rd0 = 0;
    rd1 = 0;
    rd2 = 4;
    rd3 = 0;
    rd4 = 512;
  end

  always @(posedge clk)
  begin
    rq0 <= #10  rd0;
    rq1 <= #10  rd1;
    rq2 <= #10  rd2;
    rq3 <= #10  rd3;
    rq4 <= #10  rd4;
  end

  always @(ra, rb)
  begin 
    if (ra == 0)
      RA <= #20 rq0;
    else if (ra == 1)
      RA <= #20 rq1;
    else if (ra == 2)
      RA <= #20 rq2;
    else if (ra == 3)
      RA <= #20 rq3;
    else if (ra == 4)
      RA <= #20 rq4;
    
    if (rb == 0)
      RB <= #20 rq0;
    else if (rb == 1)
      RB <= #20 rq1;
    else if (rb == 2)
      RB <= #20 rq2;
    else if (rb == 3)
      RB <= #20 rq3;
    else if (rb == 4)
      RB <= #20 rq4;  
    
  end

  always @(WriteRegister, RegWrite, WriteData)
  begin
    if (RegWrite == 1)
    begin
      if (WriteRegister == 0)
        rd0 <= #10 WriteData;
      else if (WriteRegister == 1)
        rd1 <= #10 WriteData;
      else if (WriteRegister == 2)
        rd2 <= #10 WriteData;
      else if (WriteRegister == 3)
        rd3 <= #10 WriteData;
      else if (WriteRegister == 4)
        rd4 <= #10 WriteData;  
    end
    else
    begin
      if (WriteRegister == 0)
        rd0 <= #10 rq0;
      else if (WriteRegister == 1)
        rd1 <= #10 rq1;
      else if (WriteRegister == 2)
        rd2 <= #10 rq2;
      else if (WriteRegister == 3)
        rd3 <= #10 rq3;
      else if (WriteRegister == 4)
        rd4 <= #10 rq4;  
    end 
  end
endmodule