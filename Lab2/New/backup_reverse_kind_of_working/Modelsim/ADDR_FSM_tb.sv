

module ADDR_FSM_tb;
logic start, reset, clk;
logic  [22:0] next_address;
logic  finish;


ADDR_FSM DUT( clk,
               reset,
               start,
               next_address,
               finish);


  initial begin
    clk = 0; #5; 
    forever begin
      clk = 1; #5;
      clk = 0; #5; 
    end
  end
  
  initial begin
    start = 0; #500; 
    forever begin
      start = 1; #10;
      start = 0; #500; 
    end
  end

  initial begin
    reset = 1'b0;
    #5
    reset = 1'b1;
    #5
    reset = 1'b1;
    #10;
  end
endmodule