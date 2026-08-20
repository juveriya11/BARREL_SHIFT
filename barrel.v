
module barrel #(
    parameter N = 8,
    parameter SHIFT_WIDTH = 3
)(
    input  wire [N-1:0] data_in,
    input  wire [SHIFT_WIDTH-1:0] shift,
    input  wire dir,
    input  wire [1:0] mode,
    output reg  [N-1:0] data_out
);

always @(*) begin

    case (mode)

        // 00 = Logical Shift
        2'b00: begin
            if (dir == 1'b0)
                data_out = data_in << shift;   // Left
            else
                data_out = data_in >> shift;   // Right
        end

        // 01 = Rotate
        2'b01: begin
            if (dir == 1'b0) begin
                // Rotate Left
                if (shift == 0)
                    data_out = data_in;
                else
                    data_out = (data_in << shift) |
                               (data_in >> (N - shift));
            end
            else begin
                // Rotate Right
                if (shift == 0)
                    data_out = data_in;
                else
                    data_out = (data_in >> shift) |
                               (data_in << (N - shift));
            end
        end

        // 10 = Arithmetic Right
        2'b10: begin
            if (dir == 1'b1)
                data_out = $signed(data_in) >>> shift;
            else
                data_out = data_in << shift;
        end

        default:
            data_out = data_in;

    endcase

end

endmodule