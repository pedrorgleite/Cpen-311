

module trap_edge (async_sig, clk, trapped_edge, reset);

input async_sig, clk, reset;
output trapped_edge;
logic sync1,sync2, async_trapped_sig;
assign trapped_edge = sync2;
always @ (posedge async_sig or posedge reset)
    begin
    if (reset)
    async_trapped_sig <= 1'b0;
    else
    async_trapped_sig <= 1'b1;
    end
//double sync
always @(posedge clk)
    begin
    sync1 <= async_trapped_sig;
    sync2 <= sync1;
    end

endmodule