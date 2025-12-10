`timescale 1ns/1ps

module tb_sine_pwm_simple;

    reg clk;
    reg rst;
    wire pwm_out;

    // Instantiate your DUT
    sine_pwm_simple dut (
        .clk(clk),
        .rst(rst),
        .pwm_out(pwm_out)
    );

    // Clock generation: 500 MHz → 2 ns period
    initial begin
        clk = 0;
        forever #1 clk = ~clk;  // toggle every 1ns → 2ns period
    end

    // Reset sequence
    initial begin
        rst = 1;
        #10;
        rst = 0;
    end

    // Simulation time
    initial begin
        #5000;   // run 5 us
        $stop;
    end

endmodule
