module couter_tb;
  logic clk, reset;
  logic q, max_tick;
  logic [3:0]SW;
  logic  out;

  frequency_generator dut(clk,SW[3:0],out);

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
    SW[3:1] = 3'b000;
    #1000000; 
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    SW[3:1] = 3'b001;
    #1000000;
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    SW[3:1] = 3'b010;
    #1000000;
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    SW[3:1] = 3'b011;
    #1000000;
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    SW[3:1] = 3'b100;
    #1000000;
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    SW[3:1] = 3'b101;
    #1000000;
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    SW[3:1] = 3'b110;
    #1000000;
    SW[0] = 1'b1; #10;
    SW[0] = 1'b0;
    SW[3:1] = 3'b111;
    #1000000;
    $stop;
  end
endmodule

