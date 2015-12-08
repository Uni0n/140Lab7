`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:16 11/04/2015 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(input	clk, reset,
	output [31:0] writedata, dataadr,
	output memwrite,
	output [31:0] pc, instr, readdata,
	input		[ 7:0]	switches,
	output [31:0] dispDat
    );

// Instantiate processor and memories	
	mips 	mips	(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata, switches[4:0], dispDat);
	imem 	imem	(pc[7:2], instr);
	dmem	dmem	(clk, memwrite, dataadr, writedata, readdata);
endmodule
