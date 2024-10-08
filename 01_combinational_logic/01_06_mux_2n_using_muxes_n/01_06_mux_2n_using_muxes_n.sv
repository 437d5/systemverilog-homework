//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);


  wire [3:0] y1, y2, y3;
  // Task:
  // Implement mux_4_1 using three instances of mux_2_1
  mux_2_1 mux1 ( .d1 (d3), .d0 (d2), .sel (sel [0]), .y (y1));
  mux_2_1 mux2 ( .d1 (d1), .d0 (d0), .sel (sel [0]), .y (y2));
  mux_2_1 mux3 ( .d1 (y1), .d0 (y2), .sel (sel [1]), .y (y3));
  assign y = y3;

endmodule
