module speed_controller ( clk,
                          faster,
                          slower,
                          reset_speed,
                          count,
                          countby2);

input clk;
input logic faster;
input logic slower;
input logic reset_speed;
output [31:0] count;
output [31:0] countby2;


parameter def_speed = 3'b001;
parameter go_faster = 3'b010;
parameter go_slower = 3'b100;

parameter default_speed = 32'd4544;
logic [31:0] temp_count = default_speed;
assign count = temp_count;
assign countby2 = count >> 1;

always_ff @( posedge clk) begin 
    case({slower,faster,reset_speed})
    def_speed: temp_count<= default_speed;
    go_faster: temp_count<= temp_count + 32'd20;
    go_slower: temp_count<= temp_count - 32'd20;
    3'b000: temp_count <= temp_count;
    default: temp_count<= temp_count;
    endcase
end

endmodule