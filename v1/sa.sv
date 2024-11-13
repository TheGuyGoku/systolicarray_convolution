module systolic_arry (
    input clk, rst,
    input [7:0] w,
    input [7:0] a,
    output logic [7:0] s[0:1][0:1]
);
    logic [7:0] wi[0:1][0:1];
    logic [7:0] ai[0:1][0:1];
    logic [7:0] wo[0:1][0:1];
    logic [7:0] ao[0:1][0:1];

    logic [7:0] fifo[3:0] = {0,0,0,0};
    always @(posedge clk) begin
        fifo[3:1] <= fifo[2:0];
        fifo[0] <= w;
    end

    wire [7:0] temp[1:0];
    assign temp[1] = fifo[3];
    assign temp[0] = w;
     
    //mac pe[0:1][0:1] (clk,rst,wi,ai,wo,ao,s);
    mac pe[0:1][0:1] (.clk(clk),.rst(rst),.w(wi),.a(ai),.wout(wo),.aout(ao),.s(s));

    always @(*) begin
        for (int i = 0; i<2; i++) begin
            for (int j = 0; j<2; j++) begin
                if (j==0) begin
                    ai[i][j] = a;
                end 
                else ai[i][j] = ao[i][j-1];
            end
        end
        for (int j = 0; j<2; j++) begin
            for (int i = 0; i<2; i++) begin
                if (i==0) wi[i][j] = temp[j];
                else wi[i][j] = wo[i-1][j];
            end
        end    
    end


endmodule
