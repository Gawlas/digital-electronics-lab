`timescale 1ns / 1ps

// convet number from one hot (8bit) to BCD
// example: 00010000 (4) -> 0100 (4)
module one_hot_to_bcd(input [7:0] one_hot, output [3:0] bcd);
  assign bcd[0] = one_hot[1] | one_hot[3] | one_hot[5] | one_hot[7];
  assign bcd[1] = one_hot[2] | one_hot[3] | one_hot[6] | one_hot[7];
  assign bcd[2] = one_hot[4] | one_hot[5] | one_hot[6] | one_hot[7];
  assign bcd[3] = 0;
endmodule
