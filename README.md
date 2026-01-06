# mosfet-modeling-matlab
Long-channel MOSFET modeling in MATLAB (Id–Vgs, Id–Vds, cutoff/linear/saturation).
## Step 1: Transfer curve (Id–Vgs)
- Script: code/mosfet_transfer_Id_Vgs.m
- Output: figures/mosfet_transfer_Id_Vgs.png

## Step 2: Output curves (Id–Vds)
- Script: code/mosfet_output_Id_Vds.m
- Output: figures/mosfet_output_Id_Vds.png

Notes:
- The model includes cutoff, linear, and saturation regions.
- Channel-length modulation can be enabled via parameter `lambda`.
