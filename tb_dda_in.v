`timescale 1ns/1ns
module tb_dda_in();

reg clk,rstn;
//reg [3:0]sel;

wire [7:0]data;


initial begin
    clk = 1'b1;
    rstn <= 1'b0;
  //  sel <= 1'b0;
    #20
    rstn <= 1'b1;
    /*#80000
    sel <= 4'b0001;
    #80000
    sel <= 4'b0010;
    #80000
    sel <= 4'b0100;
    #80000
    sel <= 4'b1000;
*/
end

always#10 clk =~clk;

dds_pll dds_in_0
(
    .clk(clk),
    .rstn(rstn),
 //   .sel(sel),
    .data(data)
);
endmodule