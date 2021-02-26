module frequency_generator #(parameter freq_0 = 47801, bits_0 = 16,
                                       freq_1 = 42589, bits_1 = 16,
                                       freq_2 = 37936, bits_2 = 16, 
                                       freq_3 = 35816, bits_3 = 16,
                                       freq_4 = 31928, bits_4 = 15,
                                       freq_5 = 28409, bits_5 = 15,
                                       freq_6 = 25329, bits_6 = 15,
                                       freq_7 = 23900, bits_7 = 15) 
                                        (input logic clk,
                                        input SW[3:0],
                                        input logic reset,
                                        output logic out);
//signal declaration

logic in_0;
logic in_1;
logic in_2;
logic in_3;
logic in_4;
logic in_5;
logic in_6;
logic in_7;

counter #(.N(bits_0), .M(freq_0)) freq0(.clk(clk),
                                      .reset(SW[0]),
                                      .out(in_0));
counter #(.N(bits_1), .M(freq_1)) freq1(.clk(clk),
                                      .reset(SW[0]),
                                      .out(in_1));          
counter #(.N(bits_2), .M(freq_2)) freq2(.clk(clk),
                                      .reset(SW[0]),
                                      .out(in_2));
counter #(.N(bits_3), .M(freq_3)) freq3(.clk(clk),
                                      .reset(SW[0]),
                                      .out(in_3));
counter #(.N(bits_4), .M(freq_4)) freq4(.clk(clk),
                                      .reset(SW[0]),
                                      .out(in_4));
counter #(.N(bits_5), .M(freq_5)) freq5(.clk(clk),
                                      .reset(SW[0]),
                                      .out(in_5));
counter #(.N(bits_6), .M(freq_6)) freq6(.clk(clk),
                                      .reset(SW[0]),
                                      .out(in_6));
counter #(.N(bits_7), .M(freq_7)) freq7(.clk(clk),
                                       .reset(SW[0]),
                                       .out(in_7));


always_comb
    case(SW[3:1])
      3'b000: out = in_0;
      3'b001: out = in_1;   
      3'b010: out = in_2;
      3'b011: out = in_3;
      3'b100: out = in_4;
      3'b101: out = in_5;
      3'b110: out = in_6;
      3'b111: out = in_7;
      default: out = in_0
endmodule