module sa_tb;
    reg clk, rst;
    reg [7:0] w;
    reg [7:0] a;
    logic [7:0] s[0:1][0:1];
    logic [7:0] so[0:1][0:1];

    byte image[0:2][0:2] = {{1,2,3},
                            {4,5,6},
                            {1,2,3}};
    byte kernel[0:1][0:1] = {{2,0},
                             {1,2}};

    assign so[0][0] = s[1][1];
    assign so[0][1] = s[0][1];
    assign so[1][0] = s[1][0];
    assign so[1][1] = s[0][0];

    systolic_arry sa0 (clk, rst, w, a, s);

    always #5 clk = ~clk;

    initial begin
        clk <= 0;
        rst <= 0;
        a <= 0;
        w <= 0;

        #20 rst <=1;
        #10 rst <=0;
        

        for (int i = 0; i<3; i++) begin
            for (int j = 0; j<3; j++) begin
                #10;
                a <= image[2-i][2-j];
                if ((1-i < 0) || (1-j < 0)) w <= 0;
                else w <= kernel[1-i][1-j]; 
            end
        end

        #20;
        a <= 0;
        w <= 0;
        $display("Image: %p",image);
        $display("Kernel: %p",kernel);
        $display("Output: %p",so);
    end
endmodule
