
# Keywords
- Data Types
	- UDP - User Defined Primitives
	- Built in primitives - Macros that are built in to the PDK
- Port mapping
	- Nominal - Mapped with keywords 
	- Positional - Mapped with position of the ports given 
- Contention problem (Multiple driver problem)
	- Multiple possible values, same port driven by multiple wires.
# Data types
## Verilog
## System Verilog

| Name               | Sign     | Size           | Range             |
| ------------------ | -------- | -------------- | ----------------- |
| bit                | Unsigned | 1 bit          | 0,1               |
| byte               | Signed   | 8 bits         | -128 to 127       |
| byte unsigned      | Unsigned | 8 bits         | 0 to $2^8-1$      |
| short int          | Signed   | 16 bits        | -32,768 to 32,767 |
| short int unsigned | Unsigned | 16 bits        | 0 to $2^{16}-1$   |
| int                | Signed   | 32 bits        |                   |
| int unsigned       | Unsigned | 32 bits        |                   |
| long int           | Signed   | 64 bits        |                   |
| long int unsigned  | Unsigned | 64 bits        |                   |
| string             |          | Array of chars |                   |
# Arrays
- Slicing
	- Packed
		- `bit [7:0] packed_array;`
		- U can slice these arrays
		```verilog
		bit [3:0][7:0] arr;
		//    \     \_> Number of bits in each array
		//     \_> Number of arrays
		```
	- Unpacked
		- `bit unpacked_array [7:0];`
		- U can't slice these arrays
		```verilog
		b_unpacked[0] = 2;
		b_unpacked[1] = 3;
		b_unpacked[2] = 8'h0f;
		b_unpacked[3] = 8'hab;
		
		input [31:0] din;
		din = b_unpacked; // Error is thrown
		din = {b_unpacked[3],b_unpacked[2],b_unpacked[1],b_unpacked[0]}; 
		```
- Size of arrays
	- Dynamic
		- Size of the array can be changed during runtime
		- Resized during running
			- Removing previous elements
			- Retaining previous elements
	- Static
		- Size of the array cannot be changed during runtime
	- Associative
		- The index is given a data type
		- Single dimensional
> [!Note]
> If we try to access an out of bounds value of an array, it will give the default value of 0 in system verilog.

# Queue
- A dynamic ordered array of homogeneous elements 
- syntax
	```verilog
	bit queue_1[$]; // queue of bits
	int queue_2[$]; // queue of int
	byte queue_3[$:255]; // bounded with 256 entries
	string queue_4[$]; // queue of strings
	```

	```verilog
	bit [31:0] q1[$]; // queue of 32 bit elements
	bit [31:0] b1,b2;
	
	initial begin
		q1.push_front(45);
		q1.push_back(45);
		q1.push_front(45);
		q1.push_back(45);
		
		b1 = q1.pop_front();
		b1 = q1.pop_back();
	end
	```