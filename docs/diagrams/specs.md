# &lt;rv32-axi-soc&gt; — Memory Map &amp; Register Specification

> Status: draft · Last updated: &lt;date&gt;
> Single source of truth for the SoC address map. RTL, firmware, and the UVM
> testbench all reference these addresses. Change them **here first**, then propagate.

## 1. System parameters

| Parameter      | Value                     | Notes |
|----------------|---------------------------|-------|
| Core           | PicoRV32 (`picorv32_axi`) | RV32IMC |
| Bus            | AXI4-Lite (32-bit)        | APB behind a bridge for slow peripherals |
| Data width     | 32 bits                   | |
| Address width  | 32 bits, byte-addressed   | |
| Endianness     | Little-endian             | |
| Reset vector   | `0x0000_0000`             | Must equal PicoRV32 `PROGADDR_RESET` |
| IRQ vector     | `0x0000_0010`             | Only if interrupts are enabled |

## 2. Conventions

- Addresses are **byte** addresses; registers are **word-aligned** (offsets are multiples of 4).
- Register data width is 32 bits unless noted.
- Access types: **RW** read/write · **RO** read-only · **WO** write-only · **W1C** write-1-to-clear.
- Reset values are the value held immediately after `rst_n` deasserts.
- Reads from reserved/unmapped addresses return `0x0000_0000`; writes are ignored
  (and should fire an assertion in simulation).

## 3. Top-level memory map

| Base          | End           | Size  | Region   | Bus      | Description |
|---------------|---------------|-------|----------|----------|-------------|
| `0x0000_0000` | `0x0000_FFFF` | 64 KB | RAM      | AXI-Lite | Instruction + data memory (SRAM model) |
| `0x1000_0000` | `0x1000_0FFF` | 4 KB  | UART     | APB      | Serial console |
| `0x1000_1000` | `0x1000_1FFF` | 4 KB  | GPIO     | APB      | General-purpose I/O |
| `0x1000_2000` | `0x1000_2FFF` | 4 KB  | SPI      | APB      | SPI controller |
| —             | —             | —     | reserved | —        | All other addresses |

> Decode tip: with these ranges, address bit [28] selects RAM (0) vs peripheral
> space (1), and bits [13:12] select the peripheral within that space.

## 4. Peripheral register maps

### 4.1 UART (base `0x1000_0000`)

| Offset | Name     | Access | Reset         | Description |
|--------|----------|--------|---------------|-------------|
| `0x00` | `DATA`   | RW     | `0x0000_0000` | Write = TX byte [7:0]; read = RX byte |
| `0x04` | `STATUS` | RO     | `0x0000_0001` | [0] TX ready · [1] RX valid · [2] TX busy |
| `0x08` | `CTRL`   | RW     | `0x0000_0000` | [0] TX enable · [1] RX enable · [2] RX IRQ enable |
| `0x0C` | `BAUD`   | RW     | `0x0000_0000` | Baud-rate clock divider |

### 4.2 GPIO (base `0x1000_1000`)

| Offset | Name       | Access | Reset           | Description |
|--------|------------|--------|-----------------|-------------|
| `0x00` | `DATA_OUT` | RW     | `0x0000_0000`   | Output pin values |
| `0x04` | `DATA_IN`  | RO     | board-dependent | Input pin values (synchronized) |
| `0x08` | `DIR`      | RW     | `0x0000_0000`   | Per bit: 1 = output, 0 = input |
| `0x0C` | `IRQ_STAT` | W1C    | `0x0000_0000`   | Per-pin interrupt status |

### 4.3 SPI (base `0x1000_2000`)

| Offset | Name      | Access | Reset         | Description |
|--------|-----------|--------|---------------|-------------|
| `0x00` | `CTRL`    | RW     | `0x0000_0000` | [0] enable · [1] CPOL · [2] CPHA · [3] start |
| `0x04` | `STATUS`  | RO     | `0x0000_0001` | [0] ready · [1] busy · [2] RX full |
| `0x08` | `TX_DATA` | WO     | `0x0000_0000` | Byte to transmit |
| `0x0C` | `RX_DATA` | RO     | `0x0000_0000` | Last received byte |
| `0x10` | `CLK_DIV` | RW     | `0x0000_0000` | SPI clock divider |
| `0x14` | `CS`      | RW     | `0x0000_0001` | Chip-select lines (active low) |

## 5. Notes &amp; open items

- [ ] Confirm `PROGADDR_RESET` / `PROGADDR_IRQ` in the PicoRV32 instantiation match §1.
- [ ] Decide RAM size (64 KB is ample for firmware + stack; shrink if BRAM-limited).
- [ ] Reserve a slot (e.g. `0x1000_3000`) for a future custom peripheral / FPU.
- [ ] In the test plan, record which UVM test exercises which register region.
