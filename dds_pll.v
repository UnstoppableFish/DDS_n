module dds_pll(
    input   wire    clk,rstn,
    output  wire    [7:0]data
);

wire pll_clk;
wire rst;
assign rst = ~rstn;

dds_in dds_in_0
(
    .clk(pll_clk),
    .rstn(rstn),
    .data(data)
);

pll	pll_inst (
	.areset ( rst ),
	.inclk0 ( clk ),
	.c0 ( pll_clk )
	);



endmodule