
# PLL Design and Verilog-A Behavioral Modeling

## Overview

This project presents the design and simulation of a complete Phase-Locked Loop (PLL) using Verilog-A behavioral modeling.

The PLL generates a 960 MHz output clock from a 120 MHz reference clock using a divide-by-8 feedback divider.

The project includes:

- Phase Frequency Detector (PFD)
- Charge Pump (CHP)
- Voltage Controlled Oscillator (VCO)
- Behavioral Frequency Divider
- Transistor-Level Divider
- Complete PLL Integration
- Analytical Calculations
- MATLAB-Based Loop Filter Design

---

## PLL Architecture

<img width="641" height="377" alt="image" src="https://github.com/user-attachments/assets/d703f934-3d0e-4e8a-aff4-238dde1480ec" />


## PLL Specs
Project Specifications

| Parameter | Value |
| -------- | -------- |
|Reference Frequency |120 MHz |
| Output Frequency | 960 MHz |
| Divider Ratio | 8 |
| VCO Gain (Kvco) | 2.24 GHz/V |
| Charge Pump Current | 10 µA |
| Phase Margin | 70° |
| Technology | Verilog-A Behavioral Modeling |
