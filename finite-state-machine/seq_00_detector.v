// Sequence 00 Detector
//
// States:
// 00 - 0 matched bits
// 01 - 1 matched bit
// 10 - 2 matched bits
module seq_00_detector(
  input clk,
  input seq,
  output detected,
  output reg [1:0] state
);
  localparam MATH_0 = 0;
  localparam MATH_1 = 1;
  localparam MATH_2 = 2;
  
  initial begin
    state = MATH_0;
  end
  
  always @(posedge clk) begin
    case(state)
      MATH_0 : begin
        if(seq == 0)
          state <= MATH_1;
      end
      MATH_1 : begin
        if(seq == 0)
          state <= MATH_2;
        else
          state <= MATH_0;
      end
      MATH_2 : begin
        if(seq == 1)
          state <= MATH_0;
      end
    endcase
  end
  
  assign detected = state == MATH_2 ? 1 : 0;
endmodule
 