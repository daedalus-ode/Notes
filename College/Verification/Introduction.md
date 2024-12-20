# Table of Contents
- [Verification Guidelines](#verification-guidelines)
- [Basic Test bench]
- [Directed testing]
- [Methodology basics]
- [Constrained Random Stimulus](#constrained-random-stimulus)

# Keywords
- Data Types
	- Variable definitions
		- UDP - User Defined Primitives
		- Built in primitives - Macros that are built in to the PDK
	- Number of states
		- 4 state 
			- values - 0, 1, X, Z
			- example - reg, integer, time, wire
		- 2 state
			- values - 0, 1
			- example - real, realtime
- Port mapping
	- Nominal - Mapped with keywords 
	- Positional - Mapped with position of the ports given 
- Contention problem (Multiple driver problem)
	- Multiple possible values, same port driven by multiple wires.
# Data types
## Verilog
- wire - net data types with default value of z, suitable for continuous assignment
- reg - variable data types with default value of x, suitable for procedural assignments
- integer - 4 state, signed, 32 bit data type with default value X
- time - 64 bit, unsigned variable used for debugging purposes
- real - 2 state floating point variable with default value 0.0
## System Verilog
### Inherited from verilog

| Name               | Sign     | Size           | Range             |
| ------------------ | -------- | ------- | ----------------- |
| bit                | Unsigned | 1 bit          | 0,1               |
| byte               | Signed   | 8 bits         | -128 to 127       |
| byte unsigned      | Unsigned | 8 bits         | 0 to $2^8-1$      |
| short int          | Signed   | 16 bits        | -32,768 to 32,767 |
| short int unsigned | Unsigned | 16 bits        | 0 to $2^{16}-1$   |
### Constant
- `const` is used to define a variable as a constant
### Parameter
- These values can be changed during initialisation of the module
### Arrays
- Methods
	- Reduction
		- `int b = q.sum()`
		- `int b = q.product()`
		- `int b = q.and()`
	- Locator
		- `int tq[$] = q.min();`
		- `int tq[$] = q.max();`
		- `int tq[$] = q.unique();`
	- Sorting & Ordering 
		- `d.reverse()`
		- `d.sort()`
		- `d.rsort()`
		- `d.shuffle()`
- Slicing
	- `a_vect [0 +: 8]` - a_vect[7:0]
	- `a_vect [15 -: 8]` - a_vect[15 : 8]
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
- Multi-dimensional array
	- `int mde [6][4];` `mde[i][j] = i+j;`
- Size of arrays
	- Dynamic
		- Size of the array can be changed during runtime
		- Resized during running
			- Removing previous elements
				- Retaining previous elements
		```systemverilog 
		module test
		int d1[], d2[];
		initial begin
			d1 = new[4]; // 0 initialised an empty array of size 4 
			d1[0]=11;
			d1[1]=23;
			d1[2]=33;
			d1[3]=44;
			
			d2 = d1; // copies array into another array
			d1 = new[8] (d1); // extends the array size without removing previous values
			d1 = new[100]; // extends the array size removing previous values
			$display("size = %0d", d1.size())
			d2.delete();
		end
		endmodule
		```
	- Static
		- Size of the array cannot be changed during runtime
	- Associative
		- The index is given a data type
		- Implemented using a lookup table of elements of the declared type
		- Single dimensional
		- Methods
			- `.size()`
			- `.delete(k)`
			- `.exists(k)`
			- `.first(k)`, `.next(k)`, `.prev(k)`, `.last(k)`
		```systemverilog
		int a_array[string];
		a_array["RED"] = 20;
		a_array["GREEN"] = 51;
		a_array["YELLOW"] = 36;

		int record[string] = `{"peter":20, "paul":22};

		int arr[int];
		arr[4] = 20;
		arr[9] = 2;
		
		arr.delete(4);
		
		if(arr.exists(9))
			arr[10] = 40;
		else
			arr[7] = 40;
		```
### Queue
- A dynamic ordered array of homogeneous elements 
```verilog
bit queue_1[$]; // queue of bits
int queue_2[$]; // queue of int
byte queue_3[$:255]; // bounded with 256 entries
string queue_4[$]; // queue of strings
```

```systemverilog
bit [31:0] q1[$]; // queue of 32 bit elements
bit [31:0] b1,b2;

int d[] = `{9,1,12,3,4,4,32};
int tq[$];

initial begin
	q1.push_front(45);
	q1.push_back(45);
	q1.push_front(45);
	q1.push_back(45);
	
	b1 = q1.pop_front();
	b1 = q1.pop_back();

	q1.insert(1,10); // inserts 10 at index 1
	q1.delete(1);

	tq = d.find with (item > 3); // tq = {9,12,4,4,32}
	tq = d.find_index with (item > 3); // tq = {0,2,4,5,6}
	tq = d.find_first with (item > 3); // tq = {}
	tq = d.find_first_index with (item == 12); // tq = {2}
	
end
```
### String
- Used to store a collection of characters
- Functions
	- `s.getc(0)` - gets the ASCII value of the characters
	- `s.tolower()` - converts all characters in s string to lower case
	- `s.len()` - length of string
	- `s.putc(s.len()-1, "-")` - put a character in a specific position of a string 
> [!Note]
> If we try to access an out of bounds value of an array, it will give the default value of 0 in system verilog.
### Typedef
```systemverilog
typedef bit [31:0] uint [5];

uint f5;
intial begin
	foreach (f5[i])
		f5[i] = i;
	end
```
### Structure
- Unpacked by default (can't be sliced)
- Can be made packed using `packed` keyword. 
- Packed structures can be sliced
	```verilog
	typedef struct packed {
		logic [7:0] sa;
		logic [7:0] da;
		logic [7:0] payload;
	} blah;

	program test;
	blah pkt;
	intial begin
		pkt.sa = 1;
		pkt. da = 4;
		pkt [7:0] = 40;
		$display("pkt.payload = %0d", pkt.payload);
	end
	endprogram
	...
	```

### Union
- Similar to structure
- The datatypes inside a union can only be used individually at a time.
- Unions only allocate enough memory for the biggest data in the Union
- Unions are used when you have to use memory location for two or more data members. Struct allocate enough space to store all the fields in the struct
### Type conversion (Casting)
- Static
	- Converts data types during compile time
	```verilog
	module casting
	real r_a;
	int i_a;
	initial begin
		r_a = (2.1 * 3.2)
		i_a = int'(2.1 * 3.2); // Ceiling or flooring dependendant on compiler
		
		$display("real value = %f",r_a);
		$display("int value = %d", i_a);
	end
	endmodule
	```
- Dynamic
	- Used for dynamic datatypes
	- Done using `$cast`

# Verification Guidelines
- Test whether the functionalities of a design meets the specifications provided. Also test the boundaries where the design can be used beyond the specs
- Testing levels
	- Block level - easiest, test input vs output functionality of a block
	- Integration phase - look for bugs when multiple block are connected to each other
>[!note]
>*A little History*
>- Pre 2000s - Vera and e verification languages were used to develop testbenches. It used the RVM and eRM methodologies respectively
>- Today we use System Verilog for both design and verification because of it's maintainable and reusable environment
>- The methodologies under SV include
>	- OVM (Open Verification Methodology) - Cadence
>	- AVM (Advanced Verification Methodology) - Mentor Graphics
>	- VMM (Verification Methodology Manual) - Synopsis
>	- UVM (Universal Verification Methodology) - Accellera Company
# Basic Test bench
The following steps are applied through a testbench
- Generate stimulus
- Apply stimulus to the DUT
- Capture the response
- Check for correctness
- Measure progress against the overall verification goals (Functional coverage)
# Methodology basics
- Constrained-random stimulus
- Functional coverage  
- Layered test-bench using transactors  
- Common test-bench for all tests  
- Test case-speciﬁc code kept separate from test-bench
# Types Of Test-Benches
## Directed testing
- Manually testing each test vector, logging and verification of results
- Quick results with ample staffing due to minimal infrastructure requirements 
- Steady progress
## Constrained Random Stimulus
- The main pain point of Random stimulus is the self-checking points
- While it takes longer for a random test-bench to run it's 1st test, it'll find bugs more faster than the directed test-bench where each stimulus is built from scratch
- We constraint the values sent to the design to just a relevant range and record the outputs and compare it with the predicted results
- We still use directed tests to cover tests that are not covered by random test constraints
![Image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMZ9nwVv5vFHWipBzDddlcHU0pcuVlXNM-kw&s)
# Coverage convergence
![Coverage](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUCh3Zd3q-S0RUVjVCL3vBPPhKaqlPqgis3w&s)
- Functional coverage
	- Only the relevant code and function need to be covered
- Code coverage
	- All the code lines needs to be covered under even if it's irrelevant 
# Stratified event queue
# To be revised ... #todo
