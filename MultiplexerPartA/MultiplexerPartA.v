module MultiplexerPartA (
    input [9:0] SW,    // Use switches SW9-SW0
    output [3:0] LEDR  // Output M to LEDs LEDR3-0
);

    // Inputs:
    // SW3-0 represent the 4-bit input X.
    // SW7-4 represent the 4-bit input Y.
    // SW9 is the select input s.

    wire [3:0] X = SW[3:0];  // SW3-0 as input X
    wire [3:0] Y = SW[7:4];  // SW7-4 as input Y
    wire s = SW[9];          // SW9 as the select input

    // 4-bit wide 2-to-1 multiplexer logic
    assign LEDR = (s == 0) ? X : Y;

endmodule
