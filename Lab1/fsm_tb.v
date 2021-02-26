
module led_tb;
  logic clk, reset;
  logic [3:0] SW;
  logic [7:0] LED;

  LED dut(clk, SW[3:0], LED[7:0]);




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
    #400000000; 
    $stop;
  end
endmodule