module mac (
    input clk, rst,
    input logic [7:0] w,
    input logic [7:0] a,
    output logic [7:0] wout,
    output logic [7:0] aout,
    output reg [7:0] s
);
    always @(posedge clk ) begin
        if (rst == 1) begin
            s <= 0;
            aout = 0;
            wout = 0;
        end
        else begin
            aout = a;
            wout = w;
            s <= s + (a*w);
        end
    end
endmodule
