    
    
    module sine_pwm_simple (
        input  wire clk,
        input  wire rst,     
        output reg  pwm_out
    );
    
        
        localparam PWM_WIDTH   = 8;  
        localparam PHASE_WIDTH = 8;  
    
        reg [PWM_WIDTH-1:0]   sawtooth;      // carrier
        reg [PHASE_WIDTH-1:0] phase_acc;     // for LUT addressing
        reg [PWM_WIDTH-1:0]   sine_sample;   // registered sine
        reg [PWM_WIDTH-1:0]   sine_val;      // combinational LUT output
        reg toggle;
        
        wire [4:0] addr = phase_acc[PHASE_WIDTH-1 : PHASE_WIDTH-5];
    
        always @(*) begin
            case (addr)
                5'd0  : sine_val = 8'd128;
                5'd1  : sine_val = 8'd153;
                5'd2  : sine_val = 8'd177;
                5'd3  : sine_val = 8'd199;
                5'd4  : sine_val = 8'd218;
                5'd5  : sine_val = 8'd234;
                5'd6  : sine_val = 8'd245;
                5'd7  : sine_val = 8'd253;
                5'd8  : sine_val = 8'd255;
                5'd9  : sine_val = 8'd253;
                5'd10 : sine_val = 8'd245;
                5'd11 : sine_val = 8'd234;
                5'd12 : sine_val = 8'd218;
                5'd13 : sine_val = 8'd199;
                5'd14 : sine_val = 8'd177;
                5'd15 : sine_val = 8'd153;
                5'd16 : sine_val = 8'd128;
                5'd17 : sine_val = 8'd103;
                5'd18 : sine_val = 8'd79;
                5'd19 : sine_val = 8'd57;
                5'd20 : sine_val = 8'd38;
                5'd21 : sine_val = 8'd22;
                5'd22 : sine_val = 8'd11;
                5'd23 : sine_val = 8'd3;
                5'd24 : sine_val = 8'd1;
                5'd25 : sine_val = 8'd3;
                5'd26 : sine_val = 8'd11;
                5'd27 : sine_val = 8'd22;
                5'd28 : sine_val = 8'd38;
                5'd29 : sine_val = 8'd57;
                5'd30 : sine_val = 8'd79;
                5'd31 : sine_val = 8'd103;
                default: sine_val = 8'd0;
            endcase
        end
    
        
        always @(posedge clk) begin
            if (rst) begin
                sawtooth    <= 8'd0;
                phase_acc   <= 8'b0; 
                sine_sample <= 8'd0;
                pwm_out     <= 1'b0;
                toggle<=0;
            end else begin
                if(toggle)
                    sawtooth  <= sawtooth + 8'd1;
                phase_acc <= phase_acc + 8'd1;
                sine_sample <= sine_val;
                pwm_out <= (sine_val > sawtooth);
                toggle<=~toggle;
            end
        end
    
    endmodule
