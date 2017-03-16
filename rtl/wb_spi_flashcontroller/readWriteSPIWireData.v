// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (C) <2008> <Simon Srot (simons@opencores.org) >
//---------------------------------------------------------------------
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License,or(at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.
//
//---------------------------------------------------------------------
// Copyright (c) 2009 by Lattice Semiconductor Corporation
//---------------------------------------------------------------------
// Disclaimer:
//
// This VHDL or Verilog source code is intended as a design reference
// which illustrates how these types of functions can be implemented.
// It is the user's responsibility to verify their design for
// consistency and functionality through the use of formal
// verification methods. Lattice Semiconductor provides no warranty
// regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//
// Lattice Semiconductor Corporation
// 5555 NE Moore Court
// Hillsboro, OR 97214
// U.S.A
//
// TEL: 1-800-Lattice (USA and Canada)
// 503-268-8001 (other locations)
//
// web: http://www.latticesemi.com/
// email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author     |Mod. Date |Changes Made:
// V1.0 | Peter.Zhou |01/14/09  |
//
// --------------------------------------------------------------------
//---------------------------------------------------------------------
`timescale 1ns/1ps
module readWriteSPIWireData
				(
				input 			clk,
				input[7:0]	clkDelay,
				input 			rst,
				
				output[7:0]	rxDataOut,
				output 			rxDataRdySet,
				
				output 			spiClkOut,
				input  			spiDataIn,
				output 			spiDataOut,
				output			spiCsn,
				
				output 			txDataEmpty,
				input  			txDataFull,
				output 			txDataFullClr,
				input[7:0] 	txDataIn
				);
//input   			clk;
//input   [7:0]	clkDelay;
//input   			rst;
//input   			spiDataIn;
//input   			txDataFull;
//
//input   [7:0]	txDataIn;
//output  [7:0]	rxDataOut;
//output  			rxDataRdySet;
//output  			spiClkOut;//
//output  			spiDataOut;
//output  			txDataEmpty;
//output  			txDataFullClr;

wire    			clk;
wire    [7:0]	clkDelay;
wire    			rst;
reg     [7:0]	rxDataOut,next_rxDataOut;
reg     			rxDataRdySet,next_rxDataRdySet;
reg     			spiClkOut,next_spiClkOut;
wire    			spiDataIn;
reg     			spiDataOut,next_spiDataOut;
reg     			txDataEmpty,next_txDataEmpty;
wire    			txDataFull;
reg     			txDataFullClr,next_txDataFullClr;
wire    [7:0]	txDataIn;
reg 					spiCsn,next_spiCsn;
//diagram signals declarations
reg 		[3:0]	bitCnt,next_bitCnt;
reg 		[7:0]	clkDelayCnt,next_clkDelayCnt;
reg 		[7:0]	rxDataShiftReg,next_rxDataShiftReg;
reg 		[7:0]	txDataShiftReg,next_txDataShiftReg;

// BINARY ENCODED state machine: rwSPISt
// State codes definitions:
`define WT_TX_DATA 	2'b00
`define CLK_HI 			2'b01
`define CLK_LO 			2'b10
`define ST_RW_WIRE 	2'b11

reg [1:0]CurrState_rwSPISt, NextState_rwSPISt;

// Diagram actions (continuous assignments allowed only: assign ...)
// diagram ACTION


// Machine: rwSPISt

// NextState logic (combinatorial)
always @( txDataFull or
					txDataIn or
					clkDelayCnt or
					clkDelay or
					txDataShiftReg or
					rxDataShiftReg or
					spiDataIn or
					bitCnt or
					rxDataRdySet or
					txDataEmpty or
					txDataFullClr or
					spiClkOut or
					spiDataOut or
					rxDataOut or
					CurrState_rwSPISt or
					spiCsn )
begin
  	NextState_rwSPISt 	<= CurrState_rwSPISt;
  	// Set default values for outputs and signals
  	next_rxDataRdySet 	<= rxDataRdySet;
  	next_txDataEmpty 		<= txDataEmpty;
  	next_txDataShiftReg <= txDataShiftReg;
  	next_rxDataShiftReg <= rxDataShiftReg;
  	next_bitCnt 				<= bitCnt;
  	next_clkDelayCnt 		<= clkDelayCnt;
  	next_txDataFullClr 	<= txDataFullClr;
  	next_spiClkOut 			<= spiClkOut;
  	next_spiDataOut 		<= spiDataOut;
  	next_rxDataOut 			<= rxDataOut; 
  	next_spiCsn					<= spiCsn;
  	case ( CurrState_rwSPISt )// synopsys parallel_case full_case
  	`WT_TX_DATA:
  	begin
  	  	next_rxDataRdySet <= 1'b0;
  	  	next_txDataEmpty 	<= 1'b1;
  	  	next_spiCsn				<= 1'b1;
  	  	if ( txDataFull == 1'b1 )
  	  	begin
  	  	  	NextState_rwSPISt 	<= `CLK_HI;
  	  	  	next_txDataShiftReg <= txDataIn; 
  	  	  	
  	  	  	next_rxDataShiftReg <= 8'h00;
  	  	  	next_bitCnt 				<= 4'h0;
  	  	  	next_clkDelayCnt 		<= 8'h00;
  	  	  	next_txDataFullClr 	<= 1'b1;
  	  	  	next_txDataEmpty 		<= 1'b0;
  	  	end
  	end
  	`CLK_HI:
  	begin
  	  	next_clkDelayCnt 		<= clkDelayCnt + 1'b1;
  	  	next_txDataFullClr 	<= 1'b0;
  	  	next_rxDataRdySet 	<= 1'b0;
  	  	if ( clkDelayCnt == clkDelay )
  	  	begin
  	  	  	NextState_rwSPISt 	<= `CLK_LO;
			next_spiCsn					<= 1'b0;
  	  	  	next_spiClkOut 			<= 1'b0;
  	  	  	next_spiDataOut 		<= txDataShiftReg[7];
  	  	  	next_txDataShiftReg <= {txDataShiftReg[6:0], 1'b0};
  	  	  	next_rxDataShiftReg <= {rxDataShiftReg[6:0], spiDataIn};
  	  	  	next_clkDelayCnt 		<= 8'h00;
  	  	end
  	end
  	`CLK_LO:
  	begin
  	  	next_clkDelayCnt <= clkDelayCnt + 1'b1;
  	  	if (( bitCnt == 4'h8 ) && ( txDataFull == 1'b1 ))
  	  	begin
  	  	  	NextState_rwSPISt 	<= `CLK_HI;
  	  	  	next_rxDataRdySet 	<= 1'b1;
  	  	  	next_rxDataOut 			<= rxDataShiftReg;
  	  	  	next_txDataShiftReg <= txDataIn;
  	  	  	next_bitCnt 				<= 3'b000;
  	  	  	next_clkDelayCnt 		<= 8'h00;
  	  	  	next_txDataFullClr 	<= 1'b1;
			next_spiCsn					<= 1'b1;
  	  	end
  	  	else if ( bitCnt == 4'h8 )
  	  	begin
  	  	  	NextState_rwSPISt <= `WT_TX_DATA;
  	  	  	next_rxDataRdySet <= 1'b1;
  	  	  	next_rxDataOut 		<= rxDataShiftReg;
			next_spiCsn					<= 1'b1;
  	  	end
  	  	else if ( clkDelayCnt == clkDelay )
  	  	begin
  	  	  	NextState_rwSPISt <= `CLK_HI;
  	  	  	next_spiClkOut 		<= 1'b1;
  	  	  	next_bitCnt 			<= bitCnt + 1'b1;
  	  	  	next_clkDelayCnt 	<= 8'h00;
  	  	end
  	end
  	`ST_RW_WIRE:
  	begin
  	  	next_bitCnt 				<= 4'h0;
  	  	next_clkDelayCnt 		<= 8'h00;
  	  	next_txDataFullClr 	<= 1'b0;
  	  	next_rxDataRdySet 	<= 1'b0;
  	  	next_txDataShiftReg <= 8'h00;
  	  	next_rxDataShiftReg <= 8'h00;
  	  	next_rxDataOut 			<= 8'h00;
  	  	next_spiDataOut 		<= 1'b0;
  	  	next_spiClkOut 			<= 1'b0;
  	  	next_txDataEmpty 		<= 1'b0;     
  	  	next_spiCsn					<= 1'b1;
  	  	NextState_rwSPISt 	<= `WT_TX_DATA;
  	end
  	endcase
end
// Current State Logic (sequential)
always @ (posedge clk)
begin
  	if ( rst == 1'b1 )
  	begin
  	  	CurrState_rwSPISt <= `ST_RW_WIRE;
  	end
  	else
  	begin
  	  	CurrState_rwSPISt <= NextState_rwSPISt;
  	end
end
// Registered outputs logic
always @ ( posedge clk )
begin
  	if (rst == 1'b1)
  	begin
  	  	rxDataRdySet 		<= 1'b0;
  	  	txDataEmpty 		<= 1'b0;
  	  	txDataFullClr 	<= 1'b0;
  	  	spiClkOut 			<= 1'b0;
  	  	spiDataOut 			<= 1'b0;
  	  	rxDataOut 			<= 8'h0;
  	  	txDataShiftReg 	<= 8'h0;
  	  	rxDataShiftReg 	<= 8'h0;
  	  	bitCnt 					<= 4'h0;
  	  	clkDelayCnt 		<= 8'h0; 
  	  	spiCsn					<= 1'b1;
  	end
  	else
  	begin
  	  	rxDataRdySet 		<= next_rxDataRdySet;
  	  	txDataEmpty 		<= next_txDataEmpty;
  	  	txDataFullClr 	<= next_txDataFullClr;
  	  	spiClkOut 			<= next_spiClkOut;
  	  	spiDataOut 			<= next_spiDataOut;
  	  	rxDataOut 			<= next_rxDataOut;
  	  	txDataShiftReg 	<= next_txDataShiftReg;
  	  	rxDataShiftReg 	<= next_rxDataShiftReg;
  	  	bitCnt 					<= next_bitCnt;
  	  	clkDelayCnt 		<= next_clkDelayCnt;
  	  	spiCsn					<= next_spiCsn;
  	end
end
endmodule
