`timescale 1ns / 1ps

module seq_00_detector_tb();
  parameter clock_period = 10;
  reg clock = 0;
  reg seq;
  wire detected;
  wire [1:0] state;
  
  seq_00_detector detector(clock, seq, detected, state);
  
  initial begin    
    $dumpfile("plik.vcd");
    $dumpvars(1);
    #500 $finish;
  end
  
  always #(clock_period/2) clock=~clock;
  
  initial begin
    seq = 1;
    #30 seq = 0;
    #10 seq = 1;
    #20 seq = 0;
    #40 seq = 1;
    #10 seq = 0;
  end
endmodule