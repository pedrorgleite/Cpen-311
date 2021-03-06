module FSMLED(clk, reset, in, out);
  input clk, reset, in;
  output [2:0] out;
  reg [2:0] out;

  `define SW 3
  `define Sa 3'b000
  `define Sb 3'b001
  `define Sc 3'b010
  `define Sd 3'b011 
  `define Se 3'b100 
  `define Sf 3'b101 
  `define Sg 3'b110
  `define Sh 3'b111  

  wire [1:0] present_state, next_state_reset;
  reg [1:0] next_state;

  vDFF #(`SW) STATE(clk,next_state_reset,present_state);

  // reset logic
  assign next_state_reset = reset ? `Sa : next_state;

  // next state and output logic
  always @(*) begin
    case (present_state)
      `Sa: {next_state,out} = { (in ? `Sb : `Sa), 3'b000 };
      `Sb: {next_state,out} = { (in ? `Sc : `Sb), 3'b001 };
      `Sc: {next_state,out} = { (in ? `Sd : `Sc), 3'b010 };
      `Sd: {next_state,out} = { (in ? `Se : `Sd), 3'b011 };
      `Se: {next_state,out} = { (in ? `Sf : `Se), 3'b100 };
      `Sf: {next_state,out} = { (in ? `Sg : `Sf), 3'b101 };
      `Sg: {next_state,out} = { (in ? `Sh : `Sg), 3'b110 };
      `Sh: {next_state,out} = { (in ? `Sa : `Sh), 3'b111 };
      default: {next_state,out} = 6'bxxxxxx;
    endcase
  end
endmodule