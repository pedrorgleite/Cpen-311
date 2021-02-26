module ADDR_FSM ( clk,
                  reset,
                  start,
                  next_address,
                  finish);

input start, reset, clk;
output [22:0] next_address;
output finish;

logic [22:0] mem_next_address;
logic finish;
logic [22:0] count;
logic strob_addr_logic;
logic reset_count;
logic add_count_addr;
logic [4:0] state;
parameter last_addr = 23'h0000FE;

parameter idle       = 5'b0_0000;
parameter strob_addr = 5'b0_0001;
parameter finished   = 5'b0_0010;
parameter boo_addr   = 5'b1_0000;
parameter add_addr   = 5'b1_1000;
parameter rst_count  = 5'b1_0100;

assign add_count_addr = state[3];
assign reset_count = state[2];
assign strob_addr_logic = state[0];
assign finish = state[1];

assign next_address = mem_next_address;
always_ff @(posedge clk or negedge reset)
begin
    if(~reset)
        count = 23'b0;
    else if (reset_count)
        count <= 23'b0;
    else if (add_count_addr)
        count <= count + 1;
    
end
always_ff @(posedge clk or negedge reset)
begin
    if(~reset)
        state <= idle;
    else 
        case(state)
        idle: begin
            if(start) state <= boo_addr;
            else state <= idle;
        end
        
        boo_addr:begin
            if(count==last_addr) state <= rst_count;
            else state <= add_addr;
        end
        rst_count:state <= strob_addr;

        add_addr:state <= strob_addr;

        strob_addr: state<= finished;

        finished: state <= idle ;

        default: state <= idle;
        endcase
end

always_ff @(posedge strob_addr_logic or negedge reset)
begin
    if(~reset)
        mem_next_address <= 32'b0;
    else
       mem_next_address <= count;
end
endmodule