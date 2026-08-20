
module barrel_tb;

reg  [7:0] data_in;
reg  [2:0] shift;
reg        dir;
reg  [1:0] mode;
wire [7:0] data_out;

barrel DUT (
    .data_in(data_in),
    .shift(shift),
    .dir(dir),
    .mode(mode),
    .data_out(data_out)
);

initial begin

    // Logical Left
    data_in = 8'b10110010;
    shift   = 3;
    dir     = 0;
    mode    = 2'b00;
    #10;
    $display("Logical Left  : %b", data_out);

    // Logical Right
    data_in = 8'b10110010;
    shift   = 3;
    dir     = 1;
    mode    = 2'b00;
    #10;
    $display("Logical Right : %b", data_out);

    // Rotate Left
    data_in = 8'b10110010;
    shift   = 2;
    dir     = 0;
    mode    = 2'b01;
    #10;
    $display("Rotate Left   : %b", data_out);

    // Rotate Right
    data_in = 8'b10110010;
    shift   = 2;
    dir     = 1;
    mode    = 2'b01;
    #10;
    $display("Rotate Right  : %b", data_out);

    // Arithmetic Right
    data_in = 8'b10110010;
    shift   = 2;
    dir     = 1;
    mode    = 2'b10;
    #10;
    $display("Arithmetic Right: %b", data_out);

    $finish;
end

endmodule