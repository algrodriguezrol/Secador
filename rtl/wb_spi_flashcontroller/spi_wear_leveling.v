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
`timescale 			 1ns/1ps
// clock generator
`define SYS_FREQ 25000000 	// 25MHz
`define SPI_FREQ 6250000 		// 6.25MHz
// FLASH commands
`define NOP 		 8'hFF 			// no cmd to execute
`define WREN 		 8'h06 			// write enable
`define WRDI 		 8'h04  		// write disable
`define RDSR 		 8'h05 			// read status reg
`define WRSR 		 8'h01  		// write stat. reg
`define RDCMD 	 8'h03 			// read data
`define F_RD 		 8'h0B 			// fast read data
`define PP 			 8'h02  		// page program
`define SE 			 8'hD8  		// sector erase
`define BE 			 8'hC7  		// bulk erase
`define DP 			 8'hB9  		// deep power down
`define RES 		 8'hAB  		// read signature
module spi_wear_leveling
			(
			input 						wb_clk_i,
			input 						wb_rst_i,

			input							tx_cmd_wren,
			input[7:0]				cmd,

			//input[7:0]				logical_addr_l,
			input[7:0]				logical_addr_m,
			input[7:0]				logical_addr_h,

			input[7:0]				physical_addr_l,
			input[7:0]				physical_addr_m,
			input[7:0]				physical_addr_h,

			//input[0:0]       	wr_phy_addr_l,
			//input[0:0]       	wr_phy_addr_m,
			input[0:0]       	wr_phy_addr_h,
			input[0:0]				wr_phy_addr_h_non,
			//interface to erase times memory
			input[2:0]				erase_mem_rd_addr_from_host,
			input							erase_mem_rden_from_host,
			output[23:0]			erase_mem_rd_data,

			//input[10:0] 			phy_addr_rd_from_host,
			//input							phy_addr_rden_from_host,
			output[15:0]			phy_addr_rdata,

			input[7:0]				page_valid_rd_addr_from_host,
			input							page_rden_from_host,
			output[7:0]				rd_page_data
			);
//declare and define the used parameters
parameter 							FSM_ERASE_IDLE = 3'd0;
parameter 							FSM_WAIT_PHY_ADDR = 3'd1;
parameter 							FSM_RD_ERASE_CNT_MEM = 3'd2;
parameter								FSM_RD_WAIT			 = 3'd3;
parameter 							FSM_WRITE_ERASE_CNT_TO_MEM = 3'd4;
parameter 							FSM_ERASE_TURN_AROUND = 3'd5;
//Signal declare
reg 		 								erase_cmd_flag;
reg[2:0] 								wr_sector_time;
reg[2:0] 								curr_erase_state;
reg[7:0] 								erase_cmd_reg;
reg[2:0] 								rd_sector_cnt;
reg[2:0] 								erase_mem_rd_addr;
reg			 								erase_mem_rden;
reg[2:0] 								wr_sector_cnt;
reg[2:0] 								erase_mem_wr_addr;
reg 		 								erase_mem_wren;
reg[23:0]								erase_mem_wr_data;
wire[23:0] 							erase_mem_rd_data;
//reg[7:0]								cmd_reg;
//This block is used for checking the received command from host
always @ ( posedge wb_rst_i or posedge wb_clk_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				erase_cmd_flag 	<= 1'b0;
				erase_cmd_reg		<= 8'h0;
		end
		else
		begin
				if( tx_cmd_wren == 1'b1 & ( cmd == `SE || cmd == `BE ))
				begin
						erase_cmd_flag 	 <= 1'b1;
						erase_cmd_reg    <= cmd;
				end
				else if( curr_erase_state == FSM_RD_ERASE_CNT_MEM )
				begin
						erase_cmd_flag 	 <= 1'b0;
				end
				//else if(curr_erase_state == FSM_ERASE_IDLE )
				//begin
				//	erase_cmd_reg <= 0;
				//end
		end
end
//This block is used for controlling reading and writing erase times memory
always @ ( posedge wb_rst_i or posedge wb_clk_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				curr_erase_state	<= FSM_ERASE_IDLE;
		end
		else
		begin
				case( curr_erase_state )
				FSM_ERASE_IDLE:
				begin
						if( erase_cmd_flag == 1'b1 && erase_cmd_reg == `SE )
						begin
								curr_erase_state <= FSM_WAIT_PHY_ADDR;
						end
						else if( erase_cmd_flag == 1'b1 && erase_cmd_reg == `BE )
						begin
								curr_erase_state <= FSM_RD_ERASE_CNT_MEM;
						end
				end
				FSM_WAIT_PHY_ADDR:
				begin
						if( wr_phy_addr_h == 1'b1 )
						begin
								curr_erase_state <= FSM_RD_ERASE_CNT_MEM;
						end
				end
				FSM_RD_ERASE_CNT_MEM:
				begin
						curr_erase_state 		 <= FSM_RD_WAIT;
				end
				FSM_RD_WAIT:
				begin
					curr_erase_state 		 <= FSM_WRITE_ERASE_CNT_TO_MEM;
				end
				FSM_WRITE_ERASE_CNT_TO_MEM:
				begin
						curr_erase_state 		 <= FSM_ERASE_TURN_AROUND;
				end
				FSM_ERASE_TURN_AROUND:
				begin
						if( erase_cmd_reg == `SE )
						begin
								curr_erase_state <= FSM_ERASE_IDLE;
						end
						else if( (erase_cmd_reg ==`BE) & (wr_sector_time < 3'd7) )
						begin
								curr_erase_state <= FSM_RD_ERASE_CNT_MEM;
						end
						else if( wr_sector_time == 3'd7 )
						begin
								curr_erase_state <= FSM_ERASE_IDLE;
						end
				end
				default:
				begin
						curr_erase_state <= FSM_ERASE_IDLE;
				end
				endcase
		end
end
//This block is used for counting the erase times
always @( posedge wb_rst_i or posedge wb_clk_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				wr_sector_time <= 3'd0;
		end
		else
		begin
				if( curr_erase_state == FSM_ERASE_TURN_AROUND )
				begin
						wr_sector_time	<= wr_sector_time + 1'b1;
				end
				else if( curr_erase_state == FSM_ERASE_IDLE )
				begin
						wr_sector_time	<= 3'd0;
				end
		end
end
//This block is uesed for reading erasing memory
always @( posedge wb_rst_i or posedge wb_clk_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				rd_sector_cnt 			<= 3'd0;
				erase_mem_rd_addr		<= 3'd0;
				erase_mem_rden			<= 1'b0;
		end
		else
		begin
				if( curr_erase_state == FSM_RD_ERASE_CNT_MEM & erase_cmd_reg == `SE )
				begin
						erase_mem_rd_addr 		<= physical_addr_h[2:0];
						erase_mem_rden			 	<= 1'b1;
				end
				else if( curr_erase_state == FSM_RD_ERASE_CNT_MEM & erase_cmd_reg == `BE )
				begin
						erase_mem_rd_addr 		<= rd_sector_cnt;
						rd_sector_cnt					<= rd_sector_cnt + 1;
						erase_mem_rden			 	<= 1'b1;
				end
				else if( erase_mem_rden_from_host == 1'b1 )
				begin
						erase_mem_rden			<= 1'b1;
						erase_mem_rd_addr		<= erase_mem_rd_addr_from_host;
				end
				else if( curr_erase_state == FSM_WRITE_ERASE_CNT_TO_MEM )
				begin
						erase_mem_rden			 <= 1'b0;
						//rd_sector_cnt			<= 3'd0;
				end
				else if( curr_erase_state == FSM_ERASE_IDLE )
				begin
					rd_sector_cnt			<= 3'd0;
				end
		end
end
//This block is used for writig erase memory
always @( posedge wb_rst_i or posedge wb_clk_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				wr_sector_cnt 		 <= 3'd0;
				erase_mem_wr_addr	 <= 3'd0;
				erase_mem_wren		 <= 1'b0;
				erase_mem_wr_data	 <= 24'b0;
		end
		else
		begin
				if( curr_erase_state == FSM_WRITE_ERASE_CNT_TO_MEM & erase_cmd_reg == `SE )
				begin
						erase_mem_wr_addr 		<= physical_addr_h[2:0];
						erase_mem_wren			 	<= 1'b1;
						erase_mem_wr_data			<= erase_mem_rd_data + 1;
				end
				else if( curr_erase_state == FSM_WRITE_ERASE_CNT_TO_MEM & erase_cmd_reg == `BE )
				begin
						erase_mem_wr_addr 		<= wr_sector_cnt;
						wr_sector_cnt					<= wr_sector_cnt + 1;
						erase_mem_wren			 	<= 1'b1;
						erase_mem_wr_data			<= erase_mem_rd_data + 1;
				end
				else if( curr_erase_state == FSM_ERASE_IDLE )
				begin
						erase_mem_wren			  <= 1'b0;
						wr_sector_cnt				  <= 3'd0;
				end
		end
end
//This memory is used for storing the erase times
sector_erase_cnt_memory uut0
												(
												.WrAddress( erase_mem_wr_addr			),
												.Data			( erase_mem_wr_data			),
												.WrClock	( wb_clk_i 							),
												.WE				( erase_mem_wren				),
												.WrClockEn( 1'b1								 	),
    										.RdAddress( erase_mem_rd_addr 		),
    										.RdClock	( wb_clk_i							),
    										.RdClockEn( erase_mem_rden				),
    										.Reset		( wb_rst_i							),
    										.Q				( erase_mem_rd_data			)
    										);
//This memory is used for storing the physical address
reg[10:0]   	logi_addr;
reg[15:0] 		logi_map_phy_data;
reg						logi_map_wren;
phy_addr_mem uu1
						 (
						 .WrAddress	( {logical_addr_h[2:0],logical_addr_m}	),//logi_addr
						 .RdAddress	( {logical_addr_h[2:0],logical_addr_m}	), //phy_addr_rd_from_host
						 .Data			( {5'b0,physical_addr_h[2:0],physical_addr_m}),//logi_map_phy_data
						 .WE				( (wr_phy_addr_h_non |	wr_phy_addr_h)	),//logi_map_wren
						 .RdClock		( wb_clk_i															),
						 .RdClockEn	( logical_addr_h[7]											),//phy_addr_rden_from_host				),
    				 .Reset			( wb_rst_i															),
    				 .WrClock		( wb_clk_i															),
    				 .WrClockEn	( 1'b1																	),
    				 .Q					( phy_addr_rdata												)
    				 );
//This block is used for storing the physical address
//always @( posedge wb_rst_i or posedge wb_clk_i )
//begin
//		if( wb_rst_i )
//		begin
//				logi_addr								<= 11'b0;
//				logi_map_phy_data				<= 16'd0;
//				logi_map_wren						<= 1'b0;
//		end
//		else
//		begin
//				logi_addr[7:0] 					<= logical_addr_m;
//				logi_addr[10:8] 				<= logical_addr_h[2:0];
//				logi_map_phy_data[7:0]	<= physical_addr_m;
//				logi_map_phy_data[15:8]	<= physical_addr_h;
//				logi_map_wren						<= wr_phy_addr_h_non;
//		end
//end
//This memory is used for storing the available pages
reg						 write_page_flag;
reg[7:0]   		 wr_page_cmd;
reg[2:0] 			 curr_page_state;
reg 		 			 wr_page_wren;
reg[7:0] 			 wr_page_addr;
reg[7:0] 			 wr_page_data;
reg[5:0] 			 page_pointer;

page_valid_mem uut2
							 (
							 .WrAddress	( wr_page_addr 									),
							 .RdAddress	( page_valid_rd_addr_from_host 	),
							 .Data			( wr_page_data 									),
							 .WE				( wr_page_wren									),
							 .RdClock		( wb_clk_i 											),
    					 .RdClockEn	( page_rden_from_host    				),
    					 .Reset			( wb_rst_i 											),
    					 .WrClock		( wb_clk_i 											),
    					 .WrClockEn	( 1'b1 													),
    					 .Q					( rd_page_data									)
    					 );
//--
always @ ( posedge wb_rst_i or posedge wb_clk_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				write_page_flag		<= 1'b0;
				wr_page_cmd				<= 8'b0;
		end
		else
		begin
				if( tx_cmd_wren == 1'b1 & cmd == `PP )
				begin
						write_page_flag		<= 1'b1;
						wr_page_cmd			<= cmd;
				end
				else if( curr_page_state == 3'd1 )
				begin
						write_page_flag		<= 1'b0;
				end
				else
				;
		end
end
//
always @( posedge wb_rst_i or posedge wb_clk_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				curr_page_state <= 3'd0;
				wr_page_wren		<= 1'b0;
				wr_page_addr		<= 8'b0;
				wr_page_data		<= 1'b0;
				page_pointer		<= 6'b0;
		end
		else
		begin
				case( curr_page_state )
				3'd0:
				begin
						page_pointer	<= 6'd0;
						if( write_page_flag == 1'b1 )
						begin
								curr_page_state <= 3'd1;
						end
						else if( erase_cmd_flag == 1'b1 )
						begin
								curr_page_state <= 3'd1;
						end
						else
						begin
								curr_page_state <= 3'd0;
						end
				end
				3'd1:
				begin
						if( wr_phy_addr_h == 1'b1 &  wr_page_cmd == `PP )
						begin
								wr_page_addr 					<= {physical_addr_h[2:0],physical_addr_m[7:3]};
								wr_page_wren 					<= 1'b1;
								curr_page_state 			<= 3'd3;
								case( physical_addr_m[2:0])
								3'd0: wr_page_data 		<= {wr_page_data[7:1],1'b1};
								3'd1:	wr_page_data 		<= {wr_page_data[7:2],1'b1,wr_page_data[0]};
								3'd2:	wr_page_data 		<= {wr_page_data[7:3],1'b1,wr_page_data[1:0]};
								3'd3:	wr_page_data 		<= {wr_page_data[7:4],1'b1,wr_page_data[2:0]};
								3'd4:	wr_page_data 		<= {wr_page_data[7:5],1'b1,wr_page_data[3:0]};
								3'd5:	wr_page_data 		<= {wr_page_data[7:6],1'b1,wr_page_data[4:0]};
								3'd6:	wr_page_data 		<= {wr_page_data[7],1'b1,wr_page_data[5:0]};
								3'd7:	wr_page_data 		<= {1'b1,wr_page_data[6:0]};
								endcase
						end
						else if( wr_phy_addr_h == 1'b1 &  erase_cmd_reg == `SE )
						begin
								curr_page_state <= 3'd2;
						end
				end
				3'd2:
				begin
						if( page_pointer > 8'h1F )
						begin
								curr_page_state <= 3'd3;
								wr_page_wren 		<= 1'b0;
						end
						else
						begin
								wr_page_addr		<= {physical_addr_h[2:0],page_pointer[4:0]};
								wr_page_wren 		<= 1'b1;
								wr_page_data 		<= 8'b0;
								page_pointer		<= page_pointer + 1'b1;
						end
				end
				3'd3:
				begin
						wr_page_wren 		<= 1'b0;
						curr_page_state 	<= 3'd0;
						page_pointer		<= 6'd0;
				end
				default:
				begin
						wr_page_wren 		<= 1'b0;
						curr_page_state 	<= 3'd0;
						page_pointer		<= 6'd0;
				end
				endcase
		end
end
//--
endmodule
