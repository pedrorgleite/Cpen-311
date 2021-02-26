
module frequency_generator #(parameter freq_0 = 47801, bits_0 = 16,
                                       freq_1 = 42589, bits_1 = 16,
                                       freq_2 = 37936, bits_2 = 16, 
                                       freq_3 = 35816, bits_3 = 16,
                                       freq_4 = 31928, bits_4 = 15,
                                       freq_5 = 28409, bits_5 = 15,
                                       freq_6 = 25329, bits_6 = 15,
                                       freq_7 = 23900, bits_7 = 15) 
                                        (input logic clk,
                                        input logic [3:0]SW,
                                        output logic out);
//signal declaration

logic out_0;
logic out_1;
logic out_2;
logic out_3;
logic out_4;
logic out_5;
logic out_6;
logic out_7;


logic [2:0]data;

counter #(.N(bits_0), .M(freq_0)) freq0(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_0));
counter #(.N(bits_1), .M(freq_1)) freq1(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_1));          
counter #(.N(bits_2), .M(freq_2)) freq2(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_2));
counter #(.N(bits_3), .M(freq_3)) freq3(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_3));
counter #(.N(bits_4), .M(freq_4)) freq4(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_4));
counter #(.N(bits_5), .M(freq_5)) freq5(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_5));
counter #(.N(bits_6), .M(freq_6)) freq6(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_6));
counter #(.N(bits_7), .M(freq_7)) freq7(.clk(clk),
                                    .reset(SW[0]),
                                    .out(out_7));

assign data[2:0] = SW[3:1];
always_comb
    case(data)
      3'b000: out = out_0;
      3'b001: out = out_1;   
      3'b010: out = out_2;
      3'b011: out = out_3;
      3'b100: out = out_4;
      3'b101: out = out_5;
      3'b110: out = out_6;
      3'b111: out = out_7;
      default out = 0;
    endcase

endmodule