`timescale 10ns / 10ps

module Testbench;
	reg clk, Sa, Sb;
	wire Ga, Ya, Ra, Gb, Yb, Rb;
	wire[3:0] PS;
	
	traffic UUT(clk,Sa,Sb,Ga,Ya,Ra,Gb,Yb,Rb,PS);
	
	initial begin
		clk = 1'b1;
		Sa = 1'b0;
		Sb = 1'b0;
		
		forever #5 clk = ~clk;
	end

	initial begin
		$monitor($time,,"Sa=%b Sb=%b PS=%b GYRa=%b GYRb=%b", Sa, Sb, PS, {Ga,Ya,Ra}, {Gb,Yb,Rb});
		#80
		Sa = 1'b0;
		Sb = 1'b1;
		#80
		Sa = 1'b0;
		Sb = 1'b0;
		#10
		Sa = 1'b0;
		Sb = 1'b1;
		#60
		
		$finish();
	end
endmodule
