module kbd_ipod_controller (
                            clk,
                            kbd_received_ascii_code,
                            play_music,
                            count_forward,
                            reset_address
                            );

//Lowercase Letters


parameter character_B =8'h42;
parameter character_D =8'h44;
parameter character_E =8'h45;
parameter character_F =8'h46;
parameter character_R =8'h52;

logic play_logic;
logic pause_logic;
logic forward_logic;
logic backward_logic;
logic [3:0] state;

input clk;
input [7:0] kbd_received_ascii_code;
output play_music;
output count_forward;
output reset_address;

parameter play_state = 4'b00001;
parameter pause_state = 4'b0010;
parameter forward_state = 4'b0100;
parameter backward_state = 4'b1000;

assign play_logic = state[0];
assign pause_logic = state[1];
assign forward_logic = state[2];
assign backward_logic = state[3];

always_ff @(posedge clk)
begin
    case(state)
    play_state:begin
        if(kbd_received_ascii_code==character_D) state<=pause_state;
        else if (kbd_received_ascii_code==character_B) state<=backward_state;
        else if (kbd_received_ascii_code==character_F) state<=forward_state;
        else state <= play_state;
    end
    pause_state: begin
        if(kbd_received_ascii_code==character_E) state<=play_state;
        else if (kbd_received_ascii_code==character_B) state<=backward_state;
        else if (kbd_received_ascii_code==character_F) state<= forward_state;
        else state <= pause_state;
    end
    forward_state: begin
        if(kbd_received_ascii_code==character_B) state<=backward_state;
        else if (kbd_received_ascii_code==character_E) state<=play_state;
        else if (kbd_received_ascii_code==character_D) state<=pause_state;
        else state <= forward_state;
    end
    backward_state: begin
        if(kbd_received_ascii_code==character_F) state<=forward_state;
        else if (kbd_received_ascii_code==character_E) state<=play_state;
        else if (kbd_received_ascii_code==character_D) state<=pause_state;
        else state <= backward_state;
    end
    default: begin
			if(kbd_received_ascii_code==character_D) state<=pause_state;
        else if (kbd_received_ascii_code==character_B) state<=backward_state;
        else if (kbd_received_ascii_code==character_F) state<=forward_state;
        else if(kbd_received_ascii_code==character_E) state<=play_state;
    end
    endcase

end

always @(*) begin
    if(play_logic && forward_logic)begin 
        play_music = 1'b1;
        count_forward = 1'b1;
    end
    else if (play_logic && backward_logic)begin
        play_music = 1'b1;
        count_forward = 1'b0;
    end 
    else if (pause_logic && forward_logic)begin
        play_music = 1'b0;
        count_forward = 1'b1;
    end
    else if (pause_logic && backward_logic)begin
        play_music = 1'b0;
        count_forward = 1'b0;
    end
    else begin
        play_music = 1'b1;
        count_forward = 1'b1;
    end
        
    
end
endmodule