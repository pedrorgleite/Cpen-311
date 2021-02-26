module counter #(parameter N = 16,
                           M = 47801)
                (input logic clk,
                input logic reset,
                output logic out,
                output logic max_tick);
 /*   //signal declaration
    logic[N-1:0]q;
    logic[N-1:0] l_log;
    logic[N-1:0] l_next;
    logic clk_div_next;
    logic clk_div;
    always_ff@(posedge clk, posedge reset)
        if(reset) 
            l_log<= 0;
        else      
            l_log <= l_next ;
    
    assign l_next = (l_log==(M-1)) ? 0 : l_log + 1;
    //output logic
    assign q = l_log;
    assign max_tick = (l_log==(M-1)) ? 1'b1 : 1'b0;

    always@(posedge max_tick, posedge reset)
        if(reset)
	    clk_div <= 0;
	else
	    clk_div <= clk_div_next;

    assign clk_div_next = (clk_div) ? 1'b0 : 1'b1;
    assign out = clk_div;
*/
logic [N-1:0]count;
always_ff@(posedge clk, posedge reset)
begin
    if(reset) begin
        out<= 1'b0;
        max_tick = 1'b0;
        count<= 0;
    end
    else if (count == M-1)begin     
        count <= 1'b0 ;
        max_tick = 1'b1;
        out <= ~out;
        end
    else begin
        count <= count + 1;
        max_tick = 1'b0;
        out <= out;
        end
end

endmodule