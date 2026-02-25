
module layer2(input  signed [15:0] x0, x1, x2, x3, x4, x5, x6, x7, output signed [15:0] y0, y1, y2, y3);
				  
    reg signed [15:0] W [0:3][0:7];
	reg signed [15:0] B [0:3];
									 
    integer file, i, j;
												  
    initial begin
        
        file = $fopen("W2_fx.txt", "r");
		
        for (i = 0; i < 4; i = i + 1) begin      
            for (j = 0; j < 8; j = j + 1) begin  
                $fscanf(file, "%d\n", W[i][j]);
            end
        end	 
		
        $fclose(file);
												   
        file = $fopen("b2_fx.txt", "r");
        for (i = 0; i < 4; i = i + 1) begin
            $fscanf(file, "%d\n", B[i]);
        end		  
		
        $fclose(file);	
		
    end
	
	// äæÑæä 0 
    wire signed [31:0] acc0 = x0*W[0][0] + x1*W[0][1] + x2*W[0][2] + x3*W[0][3] + x4*W[0][4] + x5*W[0][5] + x6*W[0][6] + x7*W[0][7] + B[0];
    assign y0 = (acc0 >>> 8 < 0) ? 0 : (acc0 >>> 8);
	 
    // äæÑæä 1
    wire signed [31:0] acc1 = x0*W[1][0] + x1*W[1][1] + x2*W[1][2] + x3*W[1][3] + x4*W[1][4] + x5*W[1][5] + x6*W[1][6] + x7*W[1][7] + B[1];
    assign y1 = (acc1 >>> 8 < 0) ? 0 : (acc1 >>> 8);
									  
    // äæÑæä 2
    wire signed [31:0] acc2 = x0*W[2][0] + x1*W[2][1] + x2*W[2][2] + x3*W[2][3] + x4*W[2][4] + x5*W[2][5] + x6*W[2][6] + x7*W[2][7] + B[2];
    assign y2 = (acc2 >>> 8 < 0) ? 0 : (acc2 >>> 8);
									   
    // äæÑæä 3
    wire signed [31:0] acc3 = x0*W[3][0] + x1*W[3][1] + x2*W[3][2] + x3*W[3][3] + x4*W[3][4] + x5*W[3][5] + x6*W[3][6] + x7*W[3][7] + B[3];
    assign y3 = (acc3 >>> 8 < 0) ? 0 : (acc3 >>> 8);

endmodule