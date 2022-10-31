module key_ctr(
    input   wire        clk,
    input   wire        rstn,
    input   wire    [3:0]key,

    output  reg     [3:0]out
);

reg [3:0]flag;

always @(posedge clk or negedge rstn) begin
    if(!rstn)
        out <= 0;
    else if(flag[0] == 1'b1)
        out <= 4'b0001;
    else if(flag[1] == 1'b1)
        out <= 4'b0010;
    else if(flag[2] == 1'b1)
        out <= 4'b0100;
    else if(flag[3] == 1'b1)
        out <= 4'b1000;
    else
        out <= 4'b0000;
end

key_fil
#(  .MAX_CNT(20'd500))
key_fil_0
(
    .clk(clk),
    .rstn(rstn),
    .in(key[0]),
    .flag(flag[0])
);

key_fil
#(  .MAX_CNT(20'd500))
key_fil_1
(
    .clk(clk),
    .rstn(rstn),
    .in(key[1]),
    .flag(flag[1])
);

key_fil
#(  .MAX_CNT(20'd500))
key_fil_2
(
    .clk(clk),
    .rstn(rstn),
    .in(key[2]),
    .flag(flag[2])
);

key_fil
#(  .MAX_CNT(20'd500))
key_fil_3
(
    .clk(clk),
    .rstn(rstn),
    .in(key[3]),
    .flag(flag[3])
);
endmodule