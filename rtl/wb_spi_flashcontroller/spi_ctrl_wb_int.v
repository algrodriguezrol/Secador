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
module spi_ctrl_wb_int
			(
			//global interface
			input 						wb_clk_i,
			input 						wb_rst_i,
			//slave wishbone interface
			input 		 				wb_sel_i,
			input			 				wb_wr_i,
			input[7:0] 				wb_adr_i,
			input[7:0] 				wb_dat_i,
			output reg[7:0] 	wb_dat_o,
			input 						wb_stb_i,
			output reg				wb_ack_o,

			//Spi tx data
			output reg[7:0] 	txDataOut,
			output reg				txDataFull,
			input							txDataEmpty,

			//Spi rx data
			input[7:0] 				rxDataIn,
			input			 				rxDataRdySet,

			//Interface to command check block
			output reg				tx_cmd_wren,
			output reg[7:0]		cmd,

			//Interface to logical address map to physical address
			//output reg[7:0]		logical_addr_l,
			output reg[7:0]		logical_addr_m,
			output reg[7:0]		logical_addr_h,

			output reg[7:0]		physical_addr_l,
			output reg[7:0]		physical_addr_m,
			output reg[7:0]		physical_addr_h,
			output reg 				wr_phy_addr_h_non,

			//output reg      	wr_phy_addr_l,
			//output reg      	wr_phy_addr_m,
			output reg      	wr_phy_addr_h,
			//Interface  to sector erase time address memory
			output[2:0]				erase_time_mem_addr,
			output						erase_time_mem_rden,
			input[23:0]				erase_mem_rdata,

			//Interface to physical address memory
			//output[10:0]			phy_addr,
			//output[0:0]				phy_addr_rden,
			input [15:0]			phy_addr_rdata,

			output[7:0]				page_valid_addr,
			output						page_valid_rden,
			input[7:0]				rd_page_data,
			//output						ufm_sel,
			input							txDataFullClr,
			output[7:0]				SPI_clk_delay
			);
//reg rxDataRdyClr;   
reg wr_phy_addr_l;
reg wr_phy_addr_m;

reg rxDataRdy;
reg[7:0]rxDataOut;
//reg ufm_sel;
reg command_valid;
//write command
wire[7:0] status;
assign		status = {6'b0,rxDataRdy,txDataEmpty};
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				cmd 							<= 8'b0;
				tx_cmd_wren				<= 1'b0;
		end
		else
		begin
				if(  wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h77
					)
			  begin
			  		cmd 				<= wb_dat_i;
			  		tx_cmd_wren	<= 1'b1;
			  end
			  else if( txDataEmpty == 1'b1 )
			  begin
			  		tx_cmd_wren	<= 1'b0;
			  end
		end
end
//write logical low address
//always @ ( posedge wb_clk_i or posedge wb_rst_i )
//begin
//		if( wb_rst_i == 1'b1 )
//		begin
//				logical_addr_l			<= 8'b0;
//		end
//		else
//		begin
//				if( wb_wr_i == 1'b1
//					&& wb_sel_i == 1'b1
//					&& wb_stb_i == 1'b1
//					&& wb_adr_i == 8'h1
//					)
//			  begin
//			  		logical_addr_l	<= wb_dat_i;
//			  end
//		end
//end
//write logical middle address
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				logical_addr_m <= 8'b0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h78
					)
			  begin
			  		logical_addr_m <= wb_dat_i;
			  end
		end
end
//write logical high address
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				logical_addr_h <= 8'b0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h79
					)
			  begin
			  		logical_addr_h <= wb_dat_i;
			  end
		end
end
//write physical low address
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				physical_addr_l			<= 8'b0;
				wr_phy_addr_l				<= 1'b0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h80
					)
			  begin
			  		physical_addr_l 	<= wb_dat_i;
			  		wr_phy_addr_l	<= 1'b1;
			  end
			  else if( txDataEmpty == 1'b1 )
			  begin
			  		wr_phy_addr_l		<= 1'b0;
			  end
		end
end
//write physical middle address
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				physical_addr_m			<= 8'b0;
				wr_phy_addr_m				<= 1'b0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h81
					)
			  begin
			  		physical_addr_m 			<= wb_dat_i;
			  		wr_phy_addr_m				<= 1'b1;
			  end
			  else if( txDataEmpty == 1'b1 )
			  begin
			  		wr_phy_addr_m				<= 1'b0;
			  end
		end
end
//write physical high address
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				physical_addr_h			<= 8'b0;
				wr_phy_addr_h				<= 1'b0;
				wr_phy_addr_h_non			<= 1'b0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& command_valid == 1'b1
					&& wb_adr_i == 8'h82
					)
			  begin
			  		physical_addr_h 		<= {5'b0,wb_dat_i[2:0]};
			  		wr_phy_addr_h				<= wb_dat_i[7];
			  end
			  else if(
					wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& command_valid == 1'b0
					&& wb_adr_i == 8'h82)
			  begin
						physical_addr_h 			<= {5'b0,wb_dat_i[2:0]};
			  		wr_phy_addr_h_non			<= wb_dat_i[7];
				end
			  else if( txDataEmpty == 1'b1 )
			  begin
			  		wr_phy_addr_h				<= 1'b0;
			  		wr_phy_addr_h_non			<= 1'b0;
			  end
				else
				begin
				 		wr_phy_addr_h_non			<= 1'b0;
				end
		end
end
//write data
reg write_data_wren;
reg[7:0] write_data;
always @( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				write_data_wren	<= 1'b0;
				write_data			<= 8'b0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h83
					)
			  begin
			  		write_data 			<= wb_dat_i;
						write_data_wren	<= 1'b1;
			  end
			  else
			  begin
			  		write_data_wren	<= 1'b0;
			  end
		end
end
//--
always @( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				txDataOut 	<= 8'h00;
  	  	txDataFull 	<= 1'b0;
		end
		else
		begin
				if( tx_cmd_wren == 1'b1 )
				begin
						txDataOut 	<= cmd;
  	  			txDataFull 	<= 1'b1;
				end
				else if( wr_phy_addr_l == 1'b1 & command_valid == 1'b1 )
				begin
						txDataOut 	<= physical_addr_l;
  	  			txDataFull 	<= 1'b1;
				end
				else if( wr_phy_addr_m == 1'b1 & command_valid == 1'b1 )
				begin
						txDataOut 	<= physical_addr_m;
  	  			txDataFull 	<= 1'b1;
				end
				else if( wr_phy_addr_h == 1'b1 & command_valid == 1'b1 )
				begin
						txDataOut 	<= physical_addr_h;
  	  			txDataFull 	<= 1'b1;
				end
				else if( write_data_wren == 1'b1 )
				begin
						txDataOut		<= write_data;
						txDataFull	<= 1'b1;
				end

				if (txDataFullClr == 1'b1)
  	  	  	txDataFull <= 1'b0;
		end
end
//Read data status monitor statemachine

always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
  	if (wb_rst_i == 1'b1 )
  	begin
  	  	rxDataOut <= 8'h00;
  	  	rxDataRdy <= 1'b0;
  	end
  	else
  	begin
  	  	if (rxDataRdySet == 1'b1)
  	  	begin
  	  	  	rxDataRdy <= 1'b1;
  	  	  	rxDataOut <= rxDataIn;
  	  	end
  	  	else
  	  	begin
  	  			rxDataRdy <= 1'b0;
  	  	end
  	end
end
//The user reads the sector erase times
reg[2:0] erase_time_mem_addr;
reg[0:0] erase_time_mem_rden;
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				erase_time_mem_rden <= 1'b0;
				erase_time_mem_addr <= 3'd0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h84
					)
			  begin
			  		erase_time_mem_rden		<= wb_dat_i[7];
			  		erase_time_mem_addr 	<= wb_dat_i[2:0];
			  end
			  else
			  begin
			  		erase_time_mem_rden <= 1'b0;
			  end
		end
end
//The user reads the physical address
//reg[10:0] phy_addr;
//reg[0:0]  phy_addr_rden;
//always @ ( posedge wb_clk_i or posedge wb_rst_i )
//begin
//		if( wb_rst_i == 1'b1 )
//		begin
//				phy_addr <= 11'd0;
//				phy_addr_rden <= 1'b0;
//		end
//		else
//		begin
//				if( wb_wr_i == 1'b1
//					&& wb_sel_i == 1'b1
//					&& wb_stb_i == 1'b1
//					&& wb_adr_i == 8'ha
//					)
//			  begin
//			  		phy_addr[7:0]		<= wb_dat_i;
//			  end
//			  else if( wb_wr_i == 1'b1
//					&& wb_sel_i == 1'b1
//					&& wb_stb_i == 1'b1
//					&& wb_adr_i == 8'hb
//					)
//			  begin
//			  		phy_addr[10:8]		<= wb_dat_i[2:0];
//			  		phy_addr_rden			<= wb_dat_i[7];
//			  end
//			  else
//			  begin
//			  		phy_addr_rden <= 1'b0;
//			  end
//		end
//end
//--
//reg[0:0] phy_addr_rden;
//always @ ( posedge wb_clk_i or posedge wb_rst_i )
//begin
//		if( wb_rst_i == 1'b1 )
//		begin
//				phy_addr_rden <= 1'b0;
//		end
//		else
//		begin
//				if( wb_wr_i == 1'b1
//					&& wb_sel_i == 1'b1
//					&& wb_stb_i == 1'b1
//					&& wb_adr_i == 8'hc
//					)
//			  begin
//			  		phy_addr_rden		<= wb_dat_i[0:0];
//			  end
//			  else
//			  begin
//			  		phy_addr_rden <= 1'b0;
//			  end
//		end
//end
//The user reads the page available memory
reg[7:0] page_valid_addr;
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				page_valid_addr <= 8'd0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h85
					)
			  begin
			  		page_valid_addr		<= wb_dat_i;
			  end
		end
end
//--
reg[0:0] page_valid_rden;
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				page_valid_rden <= 1'b0;
		end
		else
		begin
				if( wb_wr_i == 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h86
					)
			  begin
			  		page_valid_rden		<= wb_dat_i[0:0];
			  end
			  else
			  begin
			  		page_valid_rden <= 1'b0;
			  end
		end
end

reg[7:0] SPI_clk_delay;
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				SPI_clk_delay <= 8'b0;
		end
		else
		begin
				if(  wb_wr_i 	== 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h87
					)
			  begin
			  		SPI_clk_delay		<= wb_dat_i;
			  end
		end
end
//This register is used for selecting UFM IP
//always @ ( posedge wb_clk_i or posedge wb_rst_i )
//begin
//	if( wb_rst_i == 1'b1 )
//	begin
//		ufm_sel <= 1'b0;
//	end
//	else
//	begin
//			if(  wb_wr_i 	== 1'b1
//		  && wb_sel_i == 1'b1
//		  && wb_stb_i == 1'b1
//		  && wb_adr_i == 8'h76
//		 	)
//			begin
//					ufm_sel		<= wb_dat_i[0];
//			end
//	end
//end
//command_valid declare
always @ ( posedge wb_clk_i or posedge wb_rst_i )
begin
		if( wb_rst_i == 1'b1 )
		begin
				command_valid <= 1'b0;
		end
		else
		begin
			if(  wb_wr_i 	== 1'b1
					&& wb_sel_i == 1'b1
					&& wb_stb_i == 1'b1
					&& wb_adr_i == 8'h92
				)
			  begin
			  		command_valid		<= wb_dat_i[0];
			  end
		end
end
//generate the acknowledge signal for host
always @ ( wb_stb_i )
begin
		wb_ack_o <= wb_stb_i;
end
//Reading the register data from user
always@( wb_adr_i
				or rxDataRdy
				or rxDataIn
				or rxDataRdySet
				or erase_mem_rdata
				or phy_addr_rdata
				or rd_page_data
				or cmd
				//or logical_addr_l
				or logical_addr_m
				or logical_addr_h
				or physical_addr_l
				or physical_addr_m
				or physical_addr_h
				or wr_phy_addr_l
				or wr_phy_addr_m
				or wr_phy_addr_h
				or SPI_clk_delay
				//or phy_addr
				)
begin
		case( wb_adr_i )
		8'h77: wb_dat_o 	<= cmd;
		//8'h1: wb_dat_o	<= logical_addr_l;
		8'h78:	wb_dat_o	<= logical_addr_m;
		8'h79:	wb_dat_o	<= logical_addr_h;
		8'h80: wb_dat_o	<= physical_addr_l;
		8'h81: wb_dat_o	<= physical_addr_m;
		8'h82: wb_dat_o	<= physical_addr_h;
		8'h83: wb_dat_o	<= write_data;
		8'h84: wb_dat_o	<= {erase_time_mem_rden,4'b0,erase_time_mem_addr};
		//8'h9: wb_dat_o	<= {7'b0,erase_time_mem_rden};
		//8'ha: wb_dat_o	<= phy_addr[7:0];
		//8'hb: wb_dat_o	<= {5'b0,phy_addr[10:8]};
		//8'hc: wb_dat_o	<= {7'b0,phy_addr_rden};
		8'h85: wb_dat_o	<= page_valid_addr;
		8'h86: wb_dat_o	<= {7'b0,page_valid_rden};
		8'h87: wb_dat_o  <= SPI_clk_delay;
		8'h88: wb_dat_o <= rxDataOut;
//		8'h76: wb_dat_o <= {7'b0,ufm_sel};
		8'h89: wb_dat_o <= erase_mem_rdata[7:0];//Change this code
		8'h90: wb_dat_o <= erase_mem_rdata[15:8];
		8'h91: wb_dat_o <= erase_mem_rdata[23:16];
		8'h92: wb_dat_o	<= {7'b0,command_valid};
		8'h93: wb_dat_o <= phy_addr_rdata[7:0];
		8'h94: wb_dat_o <= phy_addr_rdata[15:8];
		8'h95: wb_dat_o <= rd_page_data;
		8'hFF: wb_dat_o <= status;
		endcase
end
endmodule
