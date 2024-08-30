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

# Stratified Event Queue
- Active region
- Inactive region
- NBA region
- Postponed region
