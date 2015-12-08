`timescale 1ns / 1ps

module mips_top_tb(
    );
reg clk, reset;
wire[31:0] writedata, dataadr;
wire memwrite;
wire [31:0] pc, instr, readdata;
reg [7:0] switches;
wire [31:0] dispDat;

top DUT(clk, reset, writedata, dataadr, memwrite, pc, instr, readdata, switches, dispDat);

initial
	begin
		clk = 0;
		reset = 1;
		switches = 8'b0;
		#20;
		reset = 0;
		switches = 8'b0000010;
	end
	
	always #5 clk = ~clk;
	
	always@(negedge clk)
	begin
		if (switches[5:0] == 2)
			if (dispDat == 32'd0)
				$display("Display: 0 , PC: %h\n", pc);
			else if (dispDat == 32'd1)
				$display("Display: 1 , PC: %h\n", pc);
			else if (dispDat == 32'd2)
				$display("Display: 2 , PC: %h\n", pc);
			else if (dispDat == 32'd6)
				$display("Display: 6 , PC: %h\n", pc);
			else if (dispDat == 32'd24) 
				begin
					$display("Display: 24 , PC: %h\n SIMULATION SUCCESS", pc);
					$stop;
				end
			else				
				begin
					$display("Simulation failed\n");
					$stop;
				end
	end
	

endmodule
