# rv32-axi-soc
 
## Architecture
 
<!-- TODO: Add block diagram image here -->
<!-- ![SoC Block Diagram](docs/diagrams/soc_block_diagram.png) -->
TODO: Block diagram
 
### Overview
 
A RISC-V SoC with AXI/APB interconnect, UVM verification, synthesis, P&R, timing closure, and FPGA prototyping.
 
### Components
 
- **Processor:** PicoRV32 (RV32IMC)
- **Bus Fabric:** AXI interconnect with AXI-to-APB bridge
- **Memory:** SRAM controller with behavioral model (custom SRAM macro planned)
- **Peripherals:** UART, SPI controller, GPIO
- **Verification:** UVM-based testbench with constrained-random stimulus and functional coverage
- **Implementation:** Synthesis, place-and-route, timing closure, FPGA prototyping
 
### Memory Map
 
| Address Range         | Peripheral     | Bus     |
|-----------------------|----------------|---------|
| `0x0000_0000 - 0x0000_FFFF` | SRAM    | AXI-Lite |
| `0x1000_0000 - 0x1000_00FF` | UART    | APB      |
| `0x1000_0100 - 0x1000_01FF` | SPI     | APB      |
| `0x1000_0200 - 0x1000_02FF` | GPIO    | APB      |
 
*Address map is preliminary and subject to change.*
 
## Project Structure
 
```
rv32-axi-soc/
├── rtl/              # RTL source
│   ├── core/         # PicoRV32
│   ├── bus/          # AXI interconnect, APB bridge
│   ├── peripherals/  # UART, SPI, GPIO
│   ├── memory/       # SRAM controller
│   └── top/          # Top-level integration
├── tb/               # Testbenches
│   ├── uvm/          # UVM environment
│   └── directed/     # Directed and system-level tests
├── constraints/      # SDC timing constraints
├── syn/              # Synthesis scripts and reports
├── pnr/              # Place and route scripts and reports
├── fpga/             # FPGA build (Vivado)
├── docs/             # Documentation
└── results/          # Curated reports and summaries
```
 
## Tools
 
| Stage            | Tool                        |
|------------------|-----------------------------|
| Simulation       | Synopsys VCS                |
| Waveform Debug   | Synopsys Verdi              |
| Linting          | Synopsys SpyGlass           |
| UVM Verification | SystemVerilog / UVM 1.2     |
| Synthesis        | Synopsys Design Compiler    |
| STA              | Synopsys PrimeTime          |
| Place & Route    | Cadence Innovus             |
| Extraction       | Cadence Quantus / Synopsys StarRC |
| FPGA             | Xilinx Vivado               |
 
## Milestones
 
- [ ] UART controller RTL + directed tests
- [ ] SPI controller RTL + directed tests
- [ ] AXI-Lite interconnect + integration
- [ ] APB bridge + peripheral integration
- [ ] UVM testbench for AXI interface
- [ ] System-level C tests
- [ ] Synthesis + timing closure
- [ ] Place and route
- [ ] FPGA prototyping
- [ ] *(Stretch)* Custom SRAM macro integration
 
## Status
 
**In progress** — project setup and RTL development.
 
## Setup
 
```bash
# Clone the repo
git clone https://github.com/MAG9090/rv32-axi-soc.git
cd rv32-axi-soc
 
# Source EDA tools (university server)
source setup_eda.sh
```
 
