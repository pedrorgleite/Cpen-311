module couter_tb2;
  logic clk, reset;

  counter #(.M(500), .N(9)) dut(clk,reset,out,max_tick);


  initial begin
    clk = 0; #5;
    forever begin
      clk = 1; #5;
      clk = 0; #5;
    end
  end

  initial begin
    reset = 1'b1; #10;
    reset = 1'b0;
    #1000000; 
    $stop;
  end
endmodule
