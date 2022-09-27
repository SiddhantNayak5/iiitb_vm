module iiitb_vm(output reg [1:0] change,output reg out,input [1:0] in, input clock,input reset);
reg [2:0] c_state,n_state;

always@(posedge clock)
begin
	if(~reset)
		c_state<=3'b000;
	else
	    c_state<=n_state;
end

always@(*)
begin
case(c_state)
3'b000:begin 
		if(in==2'b00)
			n_state=3'b000;
		else if(in==2'b01)
			n_state=3'b001;
		else if(in==2'b10)
			n_state=3'b011;
		else
			n_state=3'b000;
	  end
3'b001:begin 
		if(in==2'b00)
			n_state=3'b010;
		else if(in==2'b01)
			n_state=3'b011;
		else if(in==2'b10)
			n_state=3'b100;
		else
			n_state=3'b000;
	  end
3'b010:begin 
		if(in==2'b00)
			n_state=3'b000;
		else if(in==2'b01)
			n_state=3'b001;
		else if(in==2'b10)
			n_state=3'b011;
		else
			n_state=3'b000;
	  end
3'b011:begin 
		if(in==2'b00)
			n_state=3'b101;
		else if(in==2'b01)
			n_state=3'b100;
		else if(in==2'b10)
			n_state=3'b110;
		else
			n_state=3'b000;
	  end
3'b100:begin 
		if(in==2'b00)
			n_state=3'b000;
		else if(in==2'b01)
			n_state=3'b001;
		else if(in==2'b10)
			n_state=3'b011;
		else
			n_state=3'b000;
	  end
3'b011:begin 
		if(in==2'b00)
			n_state=3'b000;
		else if(in==2'b01)
			n_state=3'b001;
		else if(in==2'b10)
			n_state=3'b011;
		else
			n_state=3'b000;
	  end
3'b110:begin 
		if(in==2'b00)
			n_state=3'b000;
		else if(in==2'b01)
			n_state=3'b001;
		else if(in==2'b10)
			n_state=3'b011;
		else
			n_state=3'b000;
	  end
default: n_state=3'b000;
endcase
end

always@(*)
begin
case(c_state)
3'b000: begin
		change=2'b00;
		out=0;
		end
3'b001: begin
		change=2'b00;
		out=0;
		end		
3'b010: begin
		change=2'b01;
		out=0;
		end
3'b011: begin
		change=2'b00;
		out=0;
		end
3'b100: begin
		change=2'b00;
		out=1;
		end
3'b101: begin
		change=2'b10;
		out=0;
		end
3'b110: begin
		change=2'b01;
		out=1;
		end
default:begin out=0; change=2'b00; end
endcase
end

endmodule
