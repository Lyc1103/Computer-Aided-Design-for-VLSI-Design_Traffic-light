module my_fsm(r_light, y_light, g_light, 
                        sensor, clk);

output r_light, y_light, g_light;
input sensor,  clk;

reg r_light, y_light, g_light;
reg [1:0] p_state, n_state;
parameter red=2'b00, yellow=2'b01, green=2'b10;

always @(posedge clk)
 begin
  p_state <= n_state;
 end


always @(*)
 begin
 case (p_state)
	red: begin
		r_light<=1; y_light<=0; g_light<=0;
		if (sensor) n_state <= green;
		else n_state <= red;
	end
	green:begin
		r_light<=0; y_light<=0; g_light<=1;
		n_state <= yellow;
	end	 
	yellow:begin
		r_light<=0; y_light<=1; g_light<=0;
		n_state <= red;
	end	
	default:begin
		n_state <= red;
	end
 endcase
 end
endmodule
