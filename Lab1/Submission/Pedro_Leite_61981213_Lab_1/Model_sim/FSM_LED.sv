module FSMLED(input logic clk, 
              input logic reset, 
              output logic [7:0] LED);
  logic out;
  logic Clk1Hz;

// Generating a 1Hz clk frequency
counter #(.M(10), .N(4)) freq1khz(.clk(clk),
                                         .reset(reset),
                                         .out(Clk1Hz));

// All possible states of the LED position 
  parameter SW = 4;
  parameter Sa = 4'b0000;
  parameter Sb = 4'b0001;
  parameter Sc = 4'b0010;
  parameter Sd = 4'b0011; 
  parameter Se = 4'b0100; 
  parameter Sf = 4'b0101; 
  parameter Sg = 4'b0110;
  parameter Sh = 4'b0111;
  parameter Si = 4'b1000;
  parameter Sj = 4'b1001;
  parameter Sk = 4'b1010;
  parameter Sl = 4'b1011;
  parameter Sm = 4'b1100;  
  parameter Sn = 4'b1101;
  parameter So = 4'b1111;

// FSM signal declaration
  logic [3:0] present_state, next_state_reset;
  logic  [3:0] next_state;
  assign present_state = 3'b000;
  // Flip flop to save the next state into present state
  vDFF #(SW) STATE(Clk1Hz,next_state_reset,present_state);

  // Reset logic (Active low)
  assign next_state_reset = 0 ? Sa : next_state;

// FSM
// LED bounces back and forward
  always @(*) begin
    case (present_state)
      Sa: {next_state,LED[7:0]} = { Sb, 8'b10000000 };
      Sb: {next_state,LED[7:0]} = { Sc, 8'b01000000 };
      Sc: {next_state,LED[7:0]} = { Sd, 8'b00100000 };
      Sd: {next_state,LED[7:0]} = { Se, 8'b00010000 };
      Se: {next_state,LED[7:0]} = { Sf, 8'b00001000 };
      Sf: {next_state,LED[7:0]} = { Sg, 8'b00000100 };
      Sg: {next_state,LED[7:0]} = { Sh, 8'b00000010 };
      Sh: {next_state,LED[7:0]} = { Si, 8'b00000001 };
      Si: {next_state,LED[7:0]} = { Sj, 8'b00000010 };
      Sj: {next_state,LED[7:0]} = { Sk, 8'b00000100 };
      Sk: {next_state,LED[7:0]} = { Sl, 8'b00001000 };
      Sl: {next_state,LED[7:0]} = { Sm, 8'b00010000 };
      Sm: {next_state,LED[7:0]} = { Sn, 8'b00100000 };
      Sn: {next_state,LED[7:0]} = { Sa, 8'b01000000 };
      default: {next_state,LED[7:0]} = { Sa, 8'b00000000 };
    endcase
  end 

   
endmodule