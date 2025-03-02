# Intro To Vivado

## Installing the Boards
- Go to tools -> vivado store -> boards tab
- Search for the board you want
- Right click -> install

> [!NOTE]
> ### Troubleshooting
> <!--TODO: Complete this-->
> - **Board doesn't show up while creating project**
> - **Error during synthesis: board part not found**

## Vivado Flow
- Adding design
  - In the sources tab, click in the `+` symbol to add files.
  - Add/create the HDL files based on verilog/ SV/ VHDL. Add the design sources and simulation sources
  - Right click on the module name in the sources tab and set as top module
- Constraint files
  - Search for the master xdc file specific to your board. You can get this from the product page or documentation of the fpga development board
  - Add the .xdc (Xilinx Design Constraints) to the project
  - We can uncomment the desired line and assign the onboard peripherals (like GPIOs, clk, etc) to the module ports in this file
- Flow Navigator
  - In the flow navigator pane (left most vertical), we have all the flows defined. Run them:
    - Linter: goes through your design files and lints (checks for errors) for logic/syntax. etc
    - Simulation: runs simulation based on the simulation sources (testbench) we defined in the project
    - Synthesis: creates the gate level rtl of our complete project
    - Implementation: maps the rtl onto the luts present in the fpga fabric and assigns the development board pins based on the xdc file
    - Generate Bitstream: runs DRC on the implemented design and packages the generated files to be sent and programmed to the fpga
- Program the Board
  - Under generate bitstream, open Hardware Manager
  - Plug in the board and select auto connect
  - Once the board shows up on the manager, select program device
  - Select the bitstream (`.bit` file), Program device

> [!NOTE]
> ### Troubleshooting
> - **Board doesn't show up in Hardware Manager**
>   - Make sure you have all the cable drivers installed
>   - Use data transfer cables
