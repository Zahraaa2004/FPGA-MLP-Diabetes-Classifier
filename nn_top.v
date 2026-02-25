
module nn_top(input  signed [15:0] in0, in1, in2, in3, output y);
							  
    wire signed [15:0] l1_0, l1_1, l1_2, l1_3, l1_4, l1_5, l1_6, l1_7;
    wire signed [15:0] l2_0, l2_1, l2_2, l2_3;

    layer1 L1(in0, in1, in2, in3, l1_0, l1_1, l1_2, l1_3, l1_4, l1_5, l1_6, l1_7);
	layer2 L2(l1_0, l1_1, l1_2, l1_3, l1_4, l1_5, l1_6, l1_7, l2_0, l2_1, l2_2, l2_3);
   
    output_layer OUT(l2_0, l2_1, l2_2, l2_3,y);

endmodule