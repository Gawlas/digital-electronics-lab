`timescale 1ns / 1ps

// compare 4-bit number with const value (3)
// eq = 1 when numbers equal
module const_compare(input [3:0] num, output eq);
  wire [3:0] const = 4'b0011;
  wire [3:0] xor_out;
  
  xor(xor_out[0], num[0], const[0]);
  xor(xor_out[1], num[1], const[1]);
  xor(xor_out[2], num[2], const[2]);
  xor(xor_out[3], num[3], const[3]);
  or(or_out, xor_out[0], xor_out[1], xor_out[2], xor_out[3]);
  not(eq, or_out);
endmodule
