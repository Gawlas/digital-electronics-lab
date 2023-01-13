`timescale 1ns / 1ps

module one_hot_to_bcd_tb();
  reg [7:0] one_hot;
  wire [3:0] bcd;
  
  one_hot_to_bcd UUT(one_hot, bcd);
  
  initial begin : test
    test_fun(8'b00000001, 4'b0000);
    test_fun(8'b00000010, 4'b0001);
    test_fun(8'b00000100, 4'b0010);
    test_fun(8'b00001000, 4'b0011);
    test_fun(8'b00010000, 4'b0100);
    test_fun(8'b00100000, 4'b0101);
    test_fun(8'b01000000, 4'b0110);
    test_fun(8'b10000000, 4'b0111);
  end
  
  task test_fun;
    input [7:0] one_hot_in;
    input [3:0] bcd_correct;
    begin
      #5 one_hot = one_hot_in;
      #5 if(bcd != bcd_correct) begin
        $display("Test Failed: expected=%b, got=%b ", bcd, bcd_correct);
        $stop;
      end
    end
  endtask
endmodule
