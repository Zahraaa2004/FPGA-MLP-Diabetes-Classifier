 
module layer1(input  signed [15:0] x0, x1, x2, x3, output signed [15:0] y0, y1, y2, y3, y4, y5, y6, y7);
							   
    reg signed [15:0] W [0:7][0:3];
    reg signed [15:0] B [0:7];

    integer file, i, j;

    initial begin
       
        file = $fopen("W1_fx.txt", "r"); 
		
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                $fscanf(file, "%d\n", W[i][j]);
            end
        end									 
		
        $fclose(file);
								   
        file = $fopen("b1_fx.txt", "r"); 
		
        for (i = 0; i < 8; i = i + 1) begin
            $fscanf(file, "%d\n", B[i]);
        end							
		
        $fclose(file);			  
		
    end

    // äæÑæä 0
    wire signed [31:0] acc0 = x0*W[0][0] + x1*W[0][1] + x2*W[0][2] + x3*W[0][3] + B[0];
    assign y0 = (acc0 >>> 8 < 0) ? 16'sd0 : (acc0 >>> 8);

    // äæÑæä 1
    wire signed [31:0] acc1 = x0*W[1][0] + x1*W[1][1] + x2*W[1][2] + x3*W[1][3] + B[1];
    assign y1 = (acc1 >>> 8 < 0) ? 16'sd0 : (acc1 >>> 8);

    // äæÑæä 2
    wire signed [31:0] acc2 = x0*W[2][0] + x1*W[2][1] + x2*W[2][2] + x3*W[2][3] + B[2];
    assign y2 = (acc2 >>> 8 < 0) ? 16'sd0 : (acc2 >>> 8);

    // äæÑæä 3
    wire signed [31:0] acc3 = x0*W[3][0] + x1*W[3][1] + x2*W[3][2] + x3*W[3][3] + B[3];
    assign y3 = (acc3 >>> 8 < 0) ? 16'sd0 : (acc3 >>> 8);

    // äæÑæä 4
    wire signed [31:0] acc4 = x0*W[4][0] + x1*W[4][1] + x2*W[4][2] + x3*W[4][3] + B[4];
    assign y4 = (acc4 >>> 8 < 0) ? 16'sd0 : (acc4 >>> 8);

    // äæÑæä 5
    wire signed [31:0] acc5 = x0*W[5][0] + x1*W[5][1] + x2*W[5][2] + x3*W[5][3] + B[5];
    assign y5 = (acc5 >>> 8 < 0) ? 16'sd0 : (acc5 >>> 8);

    // äæÑæä 6
    wire signed [31:0] acc6 = x0*W[6][0] + x1*W[6][1] + x2*W[6][2] + x3*W[6][3] + B[6];
    assign y6 = (acc6 >>> 8 < 0) ? 16'sd0 : (acc6 >>> 8);

    // äæÑæä 7
    wire signed [31:0] acc7 = x0*W[7][0] + x1*W[7][1] + x2*W[7][2] + x3*W[7][3] + B[7];
    assign y7 = (acc7 >>> 8 < 0) ? 16'sd0 : (acc7 >>> 8);

endmodule