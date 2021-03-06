`timescale 1s/100ns
`include "serial_adder.v"

module serial_adder_tb;
  reg [3:0] data_a, data_b;
  reg clk, reset;

  wire [3:0] out;

  serial_adder s_adder(data_a, data_b, clk, reset, out);

  initial begin
    $monitor("data_a = %4b, data_b = %4b, reset = %b, out=%b", data_a, data_b, reset, out);
    $dumpfile("serial_adder_tb.vcd");
    $dumpvars(0, serial_adder_tb);
    clk = 0;
    data_a = 4'b1101; data_b = 4'b0001; reset = 1; #30;
    data_a = 4'b1101; data_b = 4'b0001; reset = 0; #200;
    $finish;
  end

  always #10 clk = !clk;

endmodule