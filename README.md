# Sinusoidal PWM Generator (SPWM) – Verilog Implementation on ZedBoard FPGA

This project implements a compact and fully synthesizable **Sinusoidal PWM Generator** in Verilog.  
The design uses a simple single-module architecture consisting of a **phase accumulator**, **sine lookup table**, **sawtooth carrier generator**, and a **comparator** to produce an SPWM waveform.

The design is simulated using Icarus Verilog and deployed on the **Xilinx ZedBoard XC7Z020** FPGA.

---

## Repository Contents

| File | Description |
|------|-------------|
| `main.v` | Main Verilog module implementing the SPWM generator |
| `main_tb.v` | Testbench for simulation |
| `main.vvp` | Compiled simulation output (Icarus Verilog) |
| `Circuit.png` | Picture of Connection|
| `simulation result (cf).png` | Simulation waveform (carrier frequency) |
| `simulation result (0.5 cf).png` | Simulation waveform (half carrier frequency) |
| `Zedboard+ Connections.jpeg` | Hardware wiring diagram for ZedBoard |
| `Zedboard-Master.xdc` | FPGA constraints file |

---

## PWM Logic

pwm_out = (sine_ref > carrier)

---
### ✔ CF (Carrier Frequency)
- The **sine phase increments once per carrier cycle**  
- Each sawtooth cycle → sine LUT index increments by 1  
- Result: **higher sine frequency**

### ✔ 0.5 CF (Half Carrier Frequency)
- The **sine phase increments once every 2 carrier cycles**  
- Every two sawtooth cycles → sine LUT index increments by 1  
- Result: **half the sine frequency**
## Simulation Instructions (Icarus Verilog)

Compile the design:

iverilog -o main.vvp main.v main_tb.v


Run simulation:

vvp main.vvp



Waveforms are included in the images:
- `simulation result (cf).png`
- `simulation result (0.5 cf).png`

---

## FPGA Implementation (Vivado)

1. Create a new Vivado RTL project  
2. Add:
   - `main.v`
   - `Zedboard-Master.xdc`
3. Select board: **ZedBoard XC7Z020**  
4. Run Synthesis → Implementation → Generate Bitstream  
5. Program the FPGA  
6. Connect output pins as shown in `Zedboard+ Connections.jpeg`

---

## Output Characteristics

- Carrier frequency: `f_carrier = clk / 256`
- Sine reference generated from 256-entry LUT
- Sine frequency controlled by phase accumulator step size
- PWM duty cycle follows the sine waveform
- Verified via simulation and oscilloscope

Applications:
- Inverter control  
- Motor control (AC, BLDC)  
- Power electronics experiments  
- FPGA-based PWM research  

---

## Future Improvements

- Three-phase SPWM  
- CORDIC-based sine generation  

---

## License

MIT License
