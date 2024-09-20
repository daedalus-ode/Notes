# System Verilog Procedures
## Functions 
- There can be no delay in functions. The output is immediate
- Syntax:
	```verilog
	function return_type func_name (arguments);
	function reg[7:0] add (input reg[7:0] a,b); // Function definition
	begin
		add = a+b; // return value same as function
	end
	endfunction
	
	function reg[7:0] sv_add (input reg[7:0] a,b); // Function definition
	// begin (not required)
		return a+b; // return keyword is specified
	// end
	endfunction
	
	reg [7:0]out;
	iniial out = add(in1, in2);
	```
- Function argument directions
	- By default the formal parameters (values passed through a function) is taken as input
	- To specify them as output, `output` keyword need to used
- Void functions - No return values
	```verilog
	function void print_state();
	$display("@%0t: state = %s", $time, cur_state.name());
	endfunction
	```
- Default value for arguments
	- These values are used if a argument is left out during a call
	- If a default value is not specified in the arguments, then it is compulsory to specify at call time
	```verilog
	function void checksum 
	(input int k, inout bit [31:0] low = 0, input int high = -1);
	
	checksum(a,1,30); // low = 1, high = 30 
	checksum(a,1); // low = 1, high = -1
	checksum(a,2); // low = 2, high = -1
	checksum(); // low = 0, high = -1
	```
- Function with enum return type
	```verilog
	typedef enum (IDLE, WAIT, LOAD, STORE) states_t;
	states_t p_state, n_state;
	function enum states_t gen_next(states_t inp_state);
		case(inp_state)
			WAIT:
			LOAD:
			STORE:
			default:
		end
	endfunction
	
	```

> [!Note]
> **# and ##**
> ---
> - \# Indicated delay with respect to combinational (time) delay 
> - \#\# Indicates clock delays, for example \#\# 6 indicates clock delays or delay of 6 clock posedges
## Tasks
- There can be delays like waits
- Tasks with timing control
	```verilog
	task wait_for_mem(input [31:0] addr, expected_data, output success)
	logic [31:0] data;
		@(posedge clk);
		data = mem [addr];
		success = (data == expected_data);
	endtask
	
	bit result 
	initial begin
	wait_for_mem(30, 50, result);
	
	if(result == 1) $display("Pass: Data Matched");
	else $display("Fall: Data Mismatch");
	```
- Task stack sharing and memory corruption when 2 different tasks are called when the other task is waiting
	- To prevent this, we use isolated stacks:- `automatic` keyword
	- syntax - `task automatic test(input [3:0] m, output [4:0] out);`
- Refs - #todo 
	- memory is not assigned in the stack
	- inout direction

# Verilog coding guidelines
1. For sequential logic use non-blocking assignment
2. modelling latches use non-blocking assignment
3. Combinational logic, use blocking assignments
4. With blocking and sequential combined, use non blocking assignment
5. Don't mix blocking and bob blocking in always block
6. Don't make assignments to same variable from more than one always block
7. Use `$strobe` to display values after non blocking assignments
8. Do not make #0 procedural assignment
# Stratified Event Queue #todo 
## Verilog
- Active region
	- Blocking statements
	- Evaluate RHS of NBA
	- $display
	- Evaluate inputs and updates outputs of primitives
- Inactive region
	- #0 Assignment
- NBA region
	- Updates LHS of NBA
- Postponed region
	- $strobe
	- $monitor
## System Verilog
- Active - Execution of module
	- Pre-active
	- Active
	- Inactive
	- Pre-NBA
	- NBA
	- Post-NBA
- Reactive - Execution of Program block
	- Reactive
	- Re-Inactive
	- Pre-Re-NBA
	- Re-NBA
	- Post-Re-NBA
# Races
- RTL vs Test-bench
	- If there is an always block in the RTL and testbench, there exists a race condition b/w them. 
	- To prevent this we use a `program` block in test-bench which is executed way after the event queue of the RTL
	- When program is used in testbench and module is RTL, RTL code is executed before program block and given more priority
- Program Block
# System Verilog Stratified Event Queue
- RTL and program block is run separately. This 
# File Structure 
- design code
- test-bench code - contains the program block to test the module
- top module
# Program constructs 
- A program block cannot contain 
- A program block cannot contain nested program blocks
- A program block cannot contain always block
- Don't need $finish. It'll automatically terminate

# Arbiter 
- A governor/scheduler for limited set of resources
# Static Class
## Properties
- global access to variables if its static
## Keywords
- `this` - used to refer ***class properties explicitly***
- `super`
## Copy
- Shallow copy
- Deep copy - skip for ISA 1