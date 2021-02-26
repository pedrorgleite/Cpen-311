

module FLASH_FSM_tb;
//input
logic clk;
logic start;
logic reset_all;
logic FSM_mem_address;
logic flash_mem_waitrequest;
logic [31:0] flash_mem_readdata;
logic flash_mem_readdatavalogic
//output 
logic flash_mem_read;
logic [22:0] flash_mem_address;
logic [3:0] flash_mem_byteenable;
logic finish;

FLASH_FSM DUT(  clk,
                start,
                reset_all,
                FSM_mem_address,
                flash_mem_waitrequest,
                flash_mem_readdata,
                flash_mem_readdatavalid,
                flash_mem_read,
                flash_mem_address, 
                flash_mem_byteenable,
                finish
                );


  initial begin
    clk = 0; #5; 
    forever begin
      clk = 1; #5;
      clk = 0; #5; 
    end
  end

  initial begin
    start = 0;
    reset_all = 1;
    FSM_mem_address = ;
    flash_mem_waitrequest;
    [31:0] flash_mem_readdata;
    flash_mem_readdatavalogic
      

  end
endmodule