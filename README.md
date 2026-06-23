# rv32-axi-soc
 
## Architecture
 
<!-- TODO: Add block diagram image here -->
<!-- ![SoC Block Diagram](docs/diagrams/soc_block_diagram.png) -->
TODO: Block diagram
<img width="791" height="529" alt="Screenshot 2026-06-22 at 19 26 19" src="https://github.com/user-attachments/assets/a520c8a4-8e2f-46e0-a9ee-7918b0df9b3e" />

 
### Overview
 
A RISC-V SoC with AXI/APB interconnect, UVM verification, synthesis, P&R, timing closure, and Openlane physical design flow.
 
### Components
 
- **Processor:** PicoRV32 (RV32IMC)
- **Bus Fabric:** AXI interconnect with AXI-to-APB bridge
- **Memory:** SRAM controller with behavioral model (custom SRAM macro planned)
- **Peripherals:** UART, SPI controller, GPIO (additional: interrupt controller, DMA controller)
- **Verification:** UVM-based testbench with constrained-random stimulus and functional coverage
- **Implementation:** Synthesis, place-and-route, timing closure, Openlane implementation
 
### Memory Map
 
| Address Range         | Peripheral     | Bus     |
|-----------------------|----------------|---------|
| `0x0000_0000 - 0x0000_FFFF` | SRAM    | AXI-Lite |
| `0x1000_0000 - 0x1000_00FF` | UART    | APB      |
| `0x1000_0100 - 0x1000_01FF` | SPI     | APB      |
| `0x1000_0200 - 0x1000_02FF` | GPIO    | APB      |
| `0x1000_0300 - 0x1000_03FF` | Other   | APB      |
 
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
- [ ] Openlane physical designe flow
 
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
 
