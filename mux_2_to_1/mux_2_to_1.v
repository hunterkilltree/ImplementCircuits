//behavioral
module mux_2_to_1(in_1, in_0, select, out);

	input in_1, in_0, select;
    //output reg out; or
	output out;
	//internal variable
	reg out;

    always@ (in_1, in_0, select) begin
        /*
		if (select == 1'b1) begin
            out = in_1;
        end
        else if (select == 1'b0) begin
            out = in_0;
        end
		*/
		if (select == 1'b1)
			out = in_1;
		else
			out = in_0;
    end

endmodule //mux_2_to_1

//testbench
module tb_mux;
    reg in_0;
    reg in_1;
    reg sel;

    wire out;

    mux_2_to_1 a(
        .in_1(in_1),
        .in_0(in_0),
        .select(sel),
        .out(out)
    );

    initial begin
        in_0 = 1'b0;
        in_1 = 1'b1;
        sel = 1'b1;
        #100
        in_0 = 1'b0;
        in_1 = 1'b1;
        sel = 1'b0;
        #100
        in_0 = 1'b1;
        in_1 = 1'b1;
        sel = 1'b0;
        #100
        in_0 = 1'b0;
        in_1 = 1'b1;
        sel = 1'b0;
    end

endmodule
