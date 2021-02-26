module kbd_ipod_controller (
                            clk,
                            kbd_received_ascii_code,
                            reset_address_value,
                            play,
                            count_forward,
                            end_addr
                            );

//Lowercase Letters
parameter character_lowercase_b= 8'h62;
parameter character_lowercase_d= 8'h64;
parameter character_lowercase_e= 8'h65;
parameter character_lowercase_f= 8'h66;

input clk;
input [7:0] kbd_received_ascii_code;
output [22:0] reset_address_value;
output play;
output count_forward;
output end_addr;

logic temp_play;
logic temp_reset_address_value;
logic temp_count_forward;
logic temp_end_addr;

assign end_addr = temp_end_addr;

assign play = temp_play;
assign reset_address_value = temp_reset_address_value;
assign count_forward = temp_count_forward;

always_ff @(posedge clk)
begin
    case(kbd_received_ascii_code)
        character_lowercase_d: temp_play <= 1'b0;
        character_lowercase_e: temp_play <= 1'b1;
        character_lowercase_b: begin
            temp_reset_address_value <= 23'h7FFFF;
            temp_count_forward <= 1'b0;
            temp_end_addr <= 23'b0;
        end 
        character_lowercase_f: begin
            temp_reset_address_value <= 23'b0;
            temp_count_forward <= 1'b1;
            temp_end_addr <= 23'h7FFFF;
        end
        default: begin
            temp_reset_address_value <= 23'b0;
            temp_count_forward <= 1'b1;
            temp_end_addr <= 23'h7FFFF;
            temp_play <= 1'b1;
        end

    endcase

end


endmodule