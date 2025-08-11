# Bubble Sort in ARMv8 Assembly

## Description
This project implements the **Bubble Sort** algorithm for an array of 64-bit integers using ARMv8 assembly language.  
It demonstrates low-level loop control, memory access, and in-place swapping using load/store instructions.

## Tech Stack
- ARMv8 Assembly (AArch64)
- GNU Assembler (GAS)

## Features
- Fully functional bubble sort algorithm in pure assembly.
- Operates on a static array stored in `.data` section.
- Uses explicit register assignments for loop variables and array manipulation.

## How to Run
### Prerequisites
- ARMv8 hardware (e.g., Raspberry Pi 4) **or** QEMU emulator
- GNU Assembler and Linker

### Assemble & Run with QEMU
```bash
aarch64-linux-gnu-as bubble_sort.s -o bubble_sort.o
aarch64-linux-gnu-ld bubble_sort.o -o bubble_sort
qemu-aarch64 ./bubble_sort```

Initial array:
255, 681, 626, 338, 309, 754, 129, 383

Sorted array (ascending):
129, 255, 309, 338, 383, 626, 681, 754
