module FLASH_FSM (  clk,
                    start,
                    reset_all,
                    FSM_mem_address,
                    flash_mem_waitrequest,
                    flash_mem_readdata,
                    flash_mem_readdatavalid,
                    flash_mem_read,
                    flash_mem_address, 
                    flash_mem_byteenable,
                    flash_mem_dataout,
                    finish
                    );

input clk;
input start;
input reset_all;
input [22:0]FSM_mem_address;
input flash_mem_waitrequest;
input logic [31:0] flash_mem_readdata;
input flash_mem_readdatavalid;

output flash_mem_read;
output [22:0] flash_mem_address;
output [3:0] flash_mem_byteenable;
output finish;
output [31:0] flash_mem_dataout;

logic allow_data_output;
logic strobe_read_logic;
logic [3:0] state;
logic [31:0] read_data;
logic [31:0] mem_data;

parameter idle        = 4'b0000;
parameter send_addr   = 4'b1001;
parameter wait_data   = 4'b1000;
parameter strobe_read = 4'b1010;
parameter finished    = 4'b1100;

assign flash_mem_read    = state[0];
assign strobe_read_logic = state[1];
assign finish            = state[2];
assign allow_data_output = state[3];

assign flash_mem_address = FSM_mem_address;
assign flash_mem_dataout = mem_data;
always_ff @(posedge clk or negedge reset_all)
begin
    if(~reset_all)
        state <=idle;
    else
        case(state)
        idle: begin
            if(start) state <= send_addr;
            else state <= idle;
              end
        send_addr: if(!flash_mem_waitrequest) state <= wait_data;
        wait_data: begin
            if(flash_mem_readdatavalid) state<=strobe_read;
            else state <= wait_data;
        end
        strobe_read: state <= finished;
        finished: begin
            state <= idle;
        end
        default: state <= idle;
        endcase
end

always_ff @(posedge strobe_read_logic or negedge reset_all)
begin
    if(~reset_all)
        mem_data <= 32'b0;
    else
        mem_data <= flash_mem_readdata;
end
endmodule