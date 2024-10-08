//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module xor_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  wire high = 1'b1;
  wire low = 1'b0;
  
  wire not_a, not_b, b_and_a_not, a_and_b_not;

  mux not_a_mux ( .d0 (high), .d1 (low), .sel (a), .y (not_a));
  mux not_b_mux ( .d0 (high), .d1 (low), .sel (b), .y (not_b));
  mux b_and_a_not_mux ( .d0 (low), .d1 (not_a), .sel (b), .y (b_and_a_not));
  mux a_and_b_not_mux ( .d0 (low), .d1 (not_b), .sel (a), .y (a_and_b_not));
  mux xor_mux ( .d0 (a_and_b_not), .d1 (high), .sel (b_and_a_not), .y (o));

endmodule
