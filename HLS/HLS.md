# Meeting notes
- Vitis libraries - meant for accelerated development of Vitis IP by combining multiple software (Vitis HLS, IDE and Xilinx design suite)
- Contains APIs meant for plug and play
- Divided into L1, L2 and L3 based on different abstraction levels
## L1
- Quick synthesis and function verification
- Device agnostic (irrespective of platform)
## L2
- `sw emu` to check functionality
- `hw emu` RTL verifications
- Contains `GQE Kernels`
- Require HBM ports
## L3
- Deals with multiple kernels and pipelining them
- Contains `GQE Kernels`
- Require HBM ports

## **GQE Engine**
- An API to efficiently manage with multi kernels 



- [[Modulator design]]