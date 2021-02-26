

module clk_tb;
  logic clk, reset;
  logic [3:0] SW;
  logic out;

  counter#(.M(10), .N(4)) dut(clk, SW[0], out);




  initial begin
    clk = 0; #5; 
    forever begin
      clk = 1; #5;
      clk = 0; #5; 
    end
  end



  initial begin
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    #1000000; 
    $stop;
  end
endmodule