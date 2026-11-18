
# P05 Left barrel shifter - dossier

## U1 Digital logic
A 2:1 multiplexer selects one of two inputs.
For each stage:
- Select = 0: output is the original input.
- Select = 1: output is shifted left by the required number of positions.

The Boolean expression for a mux is:
Y = (~S AND A) OR (S AND B).

The circuit uses multiplexers and zero-filling for logical left shifts.

## U2 Digital components
The circuit uses 2:1 multiplexers connected in three cascaded stages.
The stages shift the 8-bit input by 1, 2 and 4 positions.
The shift control bits sh[0], sh[1] and sh[2] select the stages.
Zeros enter from the right side.

## U3 Data representation
Three example test vectors:

1. a = 23, sh = 1, y = 46
   Binary: 00010111 -> 00101110
   Hex: 0x17 -> 0x2E

2. a = 9, sh = 2, y = 36
   Binary: 00001001 -> 00100100
   Hex: 0x09 -> 0x24

3. a = 128, sh = 1, y = 0
   Binary: 10000000 -> 00000000
   Hex: 0x80 -> 0x00

In an 8-bit circuit, bits shifted beyond the leftmost position are lost.
This can cause overflow of the original value.

## U4 Computer organisation
The barrel shifter performs its operation during the execute stage.
It receives the input value and shift amount and produces the shifted result.
It is a combinational circuit and does not need clock cycles or registers internally.

## U5 Processors
A CISC processor may use a different instruction implementation.
A stack machine may use stack operands instead of explicit registers.
A GPU may use parallel hardware for many operations.
The barrel shifter provides a fast hardware way to perform shifts.

## U6 Memory and I/O
The barrel shifter does not directly perform memory access or I/O transfers.
It receives data from neighbouring datapath components and sends its shifted result to the next component.

## E1 Instruction trace: BEQ (taken)
To be completed using the RC-V simulator trace output and docs/ARCHITECTURE.md.
Add the actual blocks, main signal values and branch target from the trace.

## E2 Neighbour review
Add the actual review links for P04 (ALU logic unit) and P06 (Right barrel shifter).
Do not invent review links.

## E3 Where my block sits
My block belongs to the datapath and combinational logic layer.
It receives input data and a shift amount and produces the shifted output.
The processor datapath uses its output when a shift operation is required.

## E4 Syllabus map
Topics covered:
- Logic gates and Boolean algebra
- Combinational circuits
- Multiplexers
- Number systems and binary representation
- 
