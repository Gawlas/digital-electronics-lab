`timescale 1ns / 1ps

module traffic_light_tb();
  parameter clock_period = 10;
  reg clock = 0;
  wire red;
  wire yellow;
  wire green;
  wire [1:0] state;
  wire [3:0] counter;
  
  traffic_light light(clock, red, yellow, green, state, counter);
  
  initial begin    
    $dumpfile("plik.vcd");
    $dumpvars(1);
    #2000 $finish;
  end
  
  always #(clock_period/2) clock=~clock;
endmodule