`timescale 10ns / 10ps

module Testbench;
	reg x, clk;
	wire z;
	wire[2:0] PS;
	
	fsm UUT(clk,x,PS,z);
	
	initial begin
		clk = 1'b0;
		x = 1'b0;
		
		forever #5 clk = ~clk;
	end

	initial begin
		#25
		$monitor($time,," x=%b PS=%b z=%b", x, PS,z);
		x = 1'b0;	//A z
		#5
		x = 1'b1;	//A~z
		#5
		x = 1'b1;	//E z
		#5
		x = 1'b0;	//E~z
		#5
		x = 1'b0;	//C~z
		#5
		x = 1'b1;	//C~z
		#5
		x = 1'b1;	//F z
		#5
		x = 1'b0;	//F~z
		#5
		x = 1'b1;	//G z
		#5
		x = 1'b0;	//G~z
		#5
		x = 1'b1;	//H z
		#5
		x = 1'b0;	//H~z
		#5
		x = 1'b0;	//D~z
		#5
		x = 1'b1;	//D~z
		#5
		x = 1'b0;	//B~z
		#5
		x = 1'b1;	//B~z
		#5
		x = 1'b0;	//A z
		
		$finish();
	end
endmodule
