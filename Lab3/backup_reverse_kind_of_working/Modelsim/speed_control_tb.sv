

module speed_control_tb;
logic slower, faster, clk, reset_speed;
logic  [31:0] count;
logic [31:0] countby2;

speed_controller DUT( clk,
                          faster,
                          slower,
                          reset_speed,
                          count,
                          countby2);


  initial begin
    clk = 0; #5; 
    forever begin
      clk = 1; #5;
      clk = 0; #5; 
    end
  end

  initial begin
      faster = 0; 
      slower = 0;
      reset_speed = 0; #20;
      faster = 1; #100000;
      $stop;
  end
  
endmodule
