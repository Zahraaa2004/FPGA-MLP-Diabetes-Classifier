
module output_layer( input  signed [15:0] x0, x1, x2, x3, output reg y);
	
    reg signed [15:0] W [0:3];	   
    reg signed [15:0] B;	
	
    integer file, i;							 					  
	
    initial begin
        
        file = $fopen("W3_fx.txt", "r");	
		
        for (i = 0; i < 4; i = i + 1) begin
            $fscanf(file, "%d\n", W[i]);
        end			   
		
        $fclose(file);		
		
        file = $fopen("b3_fx.txt", "r");
		
        $fscanf(file, "%d\n", B);	
		
        $fclose(file);			 
		
    end
												  
    wire signed [31:0] acc = x0*W[0] + x1*W[1] + x2*W[2] + x3*W[3] + B;
												   
    wire signed [15:0] sum = acc >>> 8;

    always @(*) begin 
		
        if (sum > 0)
            y = 1'b1;
        else
            y = 1'b0; 
			
    end

endmodule