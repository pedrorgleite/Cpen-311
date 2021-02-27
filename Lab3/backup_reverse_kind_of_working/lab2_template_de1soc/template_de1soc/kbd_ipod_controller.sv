module kbd_ipod_controller (
                            clk,
                            kbd_received_ascii_code,
                            reset_address_value,
                            play,
                            count_forward,
                            end_addr,
                            reset_address
                            );

//Lowercase Letters


parameter character_B =8'h42;
parameter character_D =8'h44;
parameter character_E =8'h45;
parameter character_F =8'h46;
parameter character_R =8'h52;



input clk;
input [7:0] kbd_received_ascii_code;
output [22:0] reset_address_value;
output play;
output count_forward;
output [22:0] end_addr;
output reset_address;

logic temp_play = 1'b0;
logic [22:0]temp_reset_address_value = 23'b0;
logic temp_count_forward = 1'b1;
logic [22:0] temp_end_addr = 23'h7FFFF;

assign end_addr = temp_end_addr;

assign play = temp_play;
assign reset_address_value = temp_reset_address_value;
assign count_forward = temp_count_forward;
assign reset_address = (kbd_received_ascii_code==character_R) ? 1'b1 : 1'b0;

always_ff @(posedge clk)
begin
    case(kbd_received_ascii_code)
        character_D: temp_play <= 1'b0;
        character_E: temp_play <= 1'b1;
        character_B: begin
            temp_reset_address_value <= 23'h7FFFF;
            temp_count_forward <= 1'b0;
            temp_end_addr <= 23'b0;
        end 
        character_F: begin
            temp_reset_address_value <= 23'b0;
            temp_count_forward <= 1'b1;
            temp_end_addr <= 23'h7FFFF;
        end
        default: begin
            temp_reset_address_value <= temp_reset_address_value;
            temp_count_forward <= temp_count_forward;
            temp_end_addr <= temp_end_addr;
            temp_play <= temp_play;
        end

    endcase

end


endmodule