# Unintended Latch in VHDL

This repository demonstrates a common, yet subtle, error in VHDL code: the accidental creation of a latch due to an unassigned signal outside a clocked process.  The original code (`bug.vhdl`) exhibits this problem, leading to unpredictable behavior.

The corrected code (`bugSolution.vhdl`) shows the proper way to avoid this latching scenario, ensuring a more robust and predictable design.

## Problem

In the `bug.vhdl` file, the `data_out` signal is assigned directly, outside the clocked process. VHDL synthesis tools may interpret this as an implicit latch, retaining the previous value of `data_out` when the clock isn't rising. This is highly problematic because latches introduce unpredictable delays and often contribute to timing closure challenges.

## Solution

The solution (`bugSolution.vhdl`) rectifies this issue by assigning `data_out` within the same clocked process as `internal_reg`.  This ensures that `data_out` is properly updated synchronously with the clock.