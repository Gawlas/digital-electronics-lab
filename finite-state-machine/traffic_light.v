module traffic_light(
  input clk,
  output red,
  output yellow,
  output green,
  output reg [1:0] state,
  output reg [3:0] counter = 0
);
  localparam RED = 0;
  localparam RED_YELLOW = 1;
  localparam GREEN = 2;
  localparam YELLOW = 3;
    
  initial begin
    state = RED;
  end
  
  always @(posedge clk) begin
    case(state)
      RED : begin
        if(counter < 1) 
          counter <= counter + 1;
        else begin
          counter <= 0;
          state <= RED_YELLOW;
        end
      end
      RED_YELLOW : begin
        counter <= 0;
        state <= GREEN;
      end
      GREEN : begin
        if(counter < 7) 
          counter <= counter + 1;
        else begin
          counter <= 0;
          state <= YELLOW;
        end
      end
      YELLOW : begin
        counter <= 0;
        state <= RED;
      end
    endcase
  end
  
  assign green = state == GREEN ? 1 : 0;
  assign yellow = (state == RED_YELLOW || state == YELLOW) ? 1 : 0;
  assign red = (state == RED_YELLOW || state == RED) ? 1 : 0;
endmodule
 