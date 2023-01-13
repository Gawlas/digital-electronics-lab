`timescale 1ns / 1ps

module const_compare_tb();
  reg [3:0] num;
  wire eq;
  reg correct;
  
  const_compare UUT(num, eq);
  
  initial begin : test
    integer i;
    
    for(i=0; i<16; i=i+1) begin
      correct = i == 3 ? 1'b1 : 1'b0;
      test_fun(i, correct);
    end
  end
  
  task test_fun;
    input [3:0] num_in;
    input eq_correct;
    begin
      #5 num = num_in;
      #5 if(eq != eq_correct) begin
        $display("Test Failed: expected=%b, got=%b ", eq, eq_correct);
        $stop;
      end
    end
  endtask
endmodule
