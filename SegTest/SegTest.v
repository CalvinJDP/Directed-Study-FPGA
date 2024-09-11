module SegTest (
    input clk,      // Clock input
    input rst_n,    // Active-low reset input
    output reg [6:0] HEX0, // Seven-segment display for the ones digit
    output reg [6:0] HEX1  // Seven-segment display for the tens digit
);

    // Registers for counting ones and tens digits
    reg [3:0] ones = 0;
    reg [3:0] tens = 0;

    // Seven-segment decoder for displaying numbers
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ones <= 0;
            tens <= 0;
        end else begin
            // Increment the ones digit
            if (ones == 9) begin
                ones <= 0;
					 #100;
                // Increment the tens digit
                if (tens == 9) begin
                    tens <= 0;
                end else begin
                    tens <= tens + 1;
                end
            end else begin
                ones <= ones + 1;
            end
        end
    end

    // Seven-segment decoder for HEX0 (ones place)
    always @(*) begin
        case (ones)
            4'b0000: HEX0 = 7'b1000000; // 0
            4'b0001: HEX0 = 7'b1111001; // 1
            4'b0010: HEX0 = 7'b0100100; // 2
            4'b0011: HEX0 = 7'b0110000; // 3
            4'b0100: HEX0 = 7'b0011001; // 4
            4'b0101: HEX0 = 7'b0010010; // 5
            4'b0110: HEX0 = 7'b0000010; // 6
            4'b0111: HEX0 = 7'b1111000; // 7
            4'b1000: HEX0 = 7'b0000000; // 8
            4'b1001: HEX0 = 7'b0010000; // 9
            default: HEX0 = 7'b1111111; // Blank display
        endcase
    end

    // Seven-segment decoder for HEX1 (tens place)
	always @(*) begin
		case (tens)
			4'b0000: HEX1 = 7'b1000000; // 0
			4'b0001: HEX1 = 7'b1111001; // 1
			4'b0010: HEX1 = 7'b0100100; // 2
			4'b0011: HEX1 = 7'b0110000; // 3
			4'b0100: HEX1 = 7'b0011001; // 4
			4'b0101: HEX1 = 7'b0010010; // 5
			4'b0110: HEX1 = 7'b0000010; // 6
			4'b0111: HEX1 = 7'b1111000; // 7
			4'b1000: HEX1 = 7'b0000000; // 8
			4'b1001: HEX1 = 7'b0010000; // 9
			default: HEX1 = 7'b1111111;  // Blank display
		endcase
end


endmodule
