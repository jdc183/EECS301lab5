module traffic(clk,Sa,Sb,Ga,Ya,Ra,Gb,Yb,Rb,PS);
input	clk,Sa,Sb;	  
output	Ga, Ya, Ra, Gb, Yb, Rb;
output[3:0] PS; 
reg[3:0] PS, NS;
reg Ga, Ya, Ra, Gb, Yb, Rb;
	
	parameter	S0 =4'b0000,S1 =4'b0001,S2 =4'b0010,S3 =4'b0011,
			S4 =4'b0100,S5 =4'b0101,S6 =4'b0110,S7 =4'b0111,
			S8 =4'b1000,S9 =4'b1001,S10=4'b1010,S11=4'b1011,
			S12=4'b1100,S13=4'b1101,S14=4'b1110,S15=4'b1111;

	always @(Sa or Sb or PS)
	begin
	
	case ({PS})
	S0: begin
		Ga=1'b1;Ya=1'b0;Ra=1'b0;//A=G
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S1;
	end
	S1: begin
		Ga=1'b1;Ya=1'b0;Ra=1'b0;//A=G
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S2;
	end
	S2: begin
		Ga=1'b1;Ya=1'b0;Ra=1'b0;//A=G
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S3;
	end
	S3: begin
		Ga=1'b1;Ya=1'b0;Ra=1'b0;//A=G
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S4;
	end
	S4: begin
		Ga=1'b1;Ya=1'b0;Ra=1'b0;//A=G
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S5;
	end
	S5: begin
		Ga=1'b1;Ya=1'b0;Ra=1'b0;//A=G
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		case({Sb})
		1'b0:NS=S5;
		1'b1:NS=S6;
		endcase
	end
	S6: begin
		Ga=1'b0;Ya=1'b1;Ra=1'b0;//A=Y
		Gb=1'b1;Yb=1'b0;Rb=1'b0;//B=R
		NS = S7;

	end
	S7: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b1;Yb=1'b0;Rb=1'b0;//B=G
		NS = S8;
	end
	S8: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b1;Yb=1'b0;Rb=1'b0;//B=G
		NS = S9;
	end
	S9: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b1;Yb=1'b0;Rb=1'b0;//B=G
		NS = S10;
	end
	S10: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b1;Yb=1'b0;Rb=1'b0;//B=G
		NS = S11;
	end
	S11: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b1;Yb=1'b0;Rb=1'b0;//B=G
		if(Sa==1'b1 && Sb==1'b0)
			NS=S11;
		else
			NS=S12;
	end
	S12: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b0;Yb=1'b1;Rb=1'b0;//B=Y
		NS = S0;
	end
	//Unexpected states: resolving contingencies.
	S13: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S0;
	end
	S14: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S0;
	end
	S15: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S0;
	end
	4'bxxxx: begin
		Ga=1'b0;Ya=1'b0;Ra=1'b1;//A=R
		Gb=1'b0;Yb=1'b0;Rb=1'b1;//B=R
		NS = S0;
	end
	endcase
end
	always @(posedge clk)
	begin
		PS = NS;
	end

endmodule
