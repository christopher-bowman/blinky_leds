`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ChrisBowman.com
// Engineer: Christopher R. Bowman
// email: <my initials>@ChrisBowman.com
// 
// Create Date: 20/09/2023 19:52:52 PM
// Design Name: 
// Module Name: top
// Project Name: zynq_blinky_leds
// Target Devices: xc7z020clg400-1
// Tool Versions: 2023.1
// Description: simple project using only the fabric.  Blink the LEDs in a
// binary sequence
// 
// Dependencies: none
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    output [3:0] led
);

localparam cycles_per_second = 125000000;

reg [3:0]leds;
reg [31:0] counter;

always @ (posedge clk)
begin
  if (counter == 0) begin
    leds <= leds + 1;
    counter <= cycles_per_second;
  end else counter <= counter - 1;
end

assign led = leds;

endmodule
