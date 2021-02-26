module FSMLED(clk, reset, in, out);
  input clk, reset, in;
  output [2:0] out;
  logic [2:0] out;

  parameter SW 3
  parameter Sa 3'b000
  parameter Sb 3'b001
  parameter Sc 3'b010
  parameter Sd 3'b011 
  parameter Se 3'b100 
  parameter Sf 3'b101 
  parameter Sg 3'b110
  parameter Sh 3'b111  

  logic [1:0] present_state, next_state_reset;
  logic [1:0] next_state;

  vDFF #(SW) STATE(clk,next_state_reset,present_state);

  // reset logic
  assign next_state_reset = reset ? `Sa : next_state;

  // next state and output logic
  always @(*) begin
    case (present_state)
      Sa: {next_state,out} = { (in ? `Sb : `Sa), 3'b000 };
      Sb: {next_state,out} = { (in ? `Sc : `Sb), 3'b001 };
      Sc: {next_state,out} = { (in ? `Sd : `Sc), 3'b010 };
      Sd: {next_state,out} = { (in ? `Se : `Sd), 3'b011 };
      Se: {next_state,out} = { (in ? `Sf : `Se), 3'b100 };
      Sf: {next_state,out} = { (in ? `Sg : `Sf), 3'b101 };
      Sg: {next_state,out} = { (in ? `Sh : `Sg), 3'b110 };
      Sh: {next_state,out} = { (in ? `Sa : `Sh), 3'b111 };
      default: {next_state,out} = 6'bxxxxxx;
    endcase
  end
endmodule