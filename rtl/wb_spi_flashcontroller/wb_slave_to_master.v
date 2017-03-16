// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2010 by Lattice Semiconductor Corporation
//---------------------------------------------------------------------
// Permission:
//
//   Lattice Semiconductor grants permission to use this code for use
//   in synthesis for any Lattice programmable logic product.  Other
//   use of this code, including the selling or duplication of any
//   portion is strictly prohibited.
//
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
// V1.0 | Peter.Zhou |10/18/10  |
//
// --------------------------------------------------------------------
//
`timescale 1ns/1ps
module wb_slave_to_master
			(
			//nrst_i,
			//clk_i,
			//mcs51_ale,
			//mcs51_rd,
			//mcs51_wr,
			//mcs51_ad_inout,

		 //wishbone slave interface
			input 						wbs_clk_i,
		  input 						wbs_rst_i,
			 	//slave wishbone interface
			input 		 				wbs_sel_i,
			input			 				wbs_wr_i,
			input[7:0] 				wbs_adr_i,
			input[7:0] 				wbs_dat_i,
			output[7:0] 			wbs_dat_o,
			input 						wbs_stb_i,
			input							wbs_cyc_i,
			output 						wbs_ack_o,

			//wishbone master interface
      output[7:0]				wbm_adr_o,
      input[7:0]				wbm_dat_i,
      output[7:0]				wbm_dat_o,
      output						wbm_sel_o,
      output						wbm_cyc_o,
      output						wbm_stb_o,
      output            wbm_we_o,
      input             wbm_ack_i,
      input							wbm_rty_i,
      input							wbm_err_i
      );
//--
//always @( posedge wb_rst_i or posedge wb_rst_i )
//begin
//
//end




//--
//parameter mcs51_aw = 8 ;
//parameter wb_aw = 16;
//--
//input nrst_i;
//input clk_i;
//input mcs51_ale;
//input mcs51_rd;
//input mcs51_wr;
//inout [mcs51_aw-1:0] mcs51_ad_inout;

// WISHBONE master interface
//output [wb_aw-1:0]  wbm_adr_o;
//input  [7:0]   			wbm_dat_i;
//output [7:0]   			wbm_dat_o;
//output         			wbm_sel_o;
//output         			wbm_cyc_o;
//output         			wbm_stb_o;
//output         			wbm_we_o;
//input          			wbm_ack_i;
//input          			wbm_rty_i;
//input          			wbm_err_i;

//wire  							l_wbm_stb;
//wire  							mcs51_ad_oe;
//
//reg   [mcs51_aw-1:0]   mcs51_addr;
//
//   always @(negedge mcs51_ale or negedge nrst_i)
//      if (~nrst_i)
//         begin
//            mcs51_addr <= {{wb_aw}{1'b0}};
//         end
//      else if(~mcs51_ale)     // Latch address
//         mcs51_addr <= { {{16-mcs51_aw}{1'b0}} , mcs51_ad_inout[mcs51_aw-1:0] };
//
//   assign mcs51_ad_oe = ~mcs51_rd;

assign wbm_adr_o 	= wbs_adr_i;
assign wbm_we_o 	= wbs_wr_i;
assign wbm_stb_o 	= wbs_stb_i;
assign wbm_cyc_o 	= wbs_cyc_i;
assign wbs_dat_o 	= wbm_dat_i;
assign wbm_sel_o 	= wbs_sel_i;
assign wbs_ack_o 	= wbm_ack_i;
assign wbm_dat_o 	= wbs_dat_i;
endmodule
