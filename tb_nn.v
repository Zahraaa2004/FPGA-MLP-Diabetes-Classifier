
`timescale 1ns/1ps

module tb_nn;

    reg  signed [15:0] in0, in1, in2, in3;
    wire y;
							   
    nn_top DUT (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .y(y));

    initial begin				   			  
		
        in0 = 16'sd43;
        in1 = 16'sd87;
        in2 = 16'sd120;
        in3 = 16'sd95;

        #20; 

        $display("NN output = %0d", y);

        #10;  
		
        $stop;	
		
    end

endmodule