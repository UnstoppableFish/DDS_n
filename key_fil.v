module key_fil
#(parameter MAX_CNT = 9999_999)
(
    input rstn,clk,in,
    output reg flag
);

reg [20:0]cnt;

always @(posedge clk or negedge rstn) begin
    if (!rstn)
        cnt <= 0;
    else if(in == 1'b1)
        cnt <= 0;
    else if(cnt < (MAX_CNT - 1))
        cnt <= cnt + 1;
    else 
        cnt <= 0;
end

always @(posedge clk or negedge rstn) begin
    if (!rstn)
        flag <= 0;
    else if(cnt == 100)
        flag <= 1;
    else
        flag <= 0;
end

endmodule