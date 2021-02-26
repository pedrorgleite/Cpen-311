
module audio_fsm_tb;

logic clk, reset, start;
logic [31:0] data;
logic  finish;
logic  [7:0] audio_signal;
logic [19:0] M;
  logic [19:0] max_count;
  logic out;
  logic max_tick;

counter #(26) dut2(clk,
                  ~reset,
                   max_count,
                   out,
                   max_tick);    
Audio_fsm DUT(  clk,
                    reset,
                    M,
                    data,
                    max_tick,
                    finish,
                    audio_signal);
                

initial begin
    clk = 0; #5; 
    forever begin
      clk = 1; #5;
      clk = 0; #5; 
    end
  end
  

initial begin
    reset = 1'b0;
    M= 20'd25;
    max_count= 20'd50;
    #10;
    reset = 1'b1;
    #10;
    data = 32'h040503FE;


end
endmodule