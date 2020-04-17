module fsm(clk,x,S,z);
input	clk,x; 	//I assume x is an input  
output	z; 	//and z is the output. 
output[2:0] S;

reg[2:0] PS;
wire[2:0] NS;
	//these state definitions ended up being unnecessary
	parameter	A=3'b000, B=3'b001, C=3'b010, D=3'b011,
			E=3'b100, F=3'b101, G=3'b110, H=3'b111;
	assign z = ~x&~PS[2]&~PS[1]&~PS[0] | x&PS[2];
	assign NS = {x,PS[2:1]};
	assign S = PS;
	
	always @( posedge clk)
	begin
		PS = NS;
	end

endmodule
