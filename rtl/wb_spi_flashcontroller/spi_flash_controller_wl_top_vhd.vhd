--// --------------------------------------------------------------------
--// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
--// --------------------------------------------------------------------
--// Copyright (c) 2010 by Lattice Semiconductor Corporation
--//---------------------------------------------------------------------
--// Permission:
--//
--//   Lattice Semiconductor grants permission to use this code for use
--//   in synthesis for any Lattice programmable logic product.  Other
--//   use of this code, including the selling or duplication of any
--//   portion is strictly prohibited.
--//
--// Disclaimer:
--//
--// This VHDL or Verilog source code is intended as a design reference
--// which illustrates how these types of functions can be implemented.
--// It is the user's responsibility to verify their design for
--// consistency and functionality through the use of formal
--// verification methods. Lattice Semiconductor provides no warranty
--// regarding the use or functionality of this code.
--//
--// --------------------------------------------------------------------
--//
--// Lattice Semiconductor Corporation
--// 5555 NE Moore Court
--// Hillsboro, OR 97214
--// U.S.A
--//
--// TEL: 1-800-Lattice (USA and Canada)
--// 503-268-8001 (other locations)
--//
--// web: http://www.latticesemi.com/
--// email: techsupport@latticesemi.com
--//
--// --------------------------------------------------------------------
--// Code Revision History :
--// --------------------------------------------------------------------
--// Ver: | Author     |Mod. Date |Changes Made:
--// V1.0 | Peter.Zhou |10/18/10  |
--//
--// --------------------------------------------------------------------
--//
--`timescale 1ns/1ps
library ieee;                   
use ieee.std_logic_1164.all;    
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spi_flash_controller_wl_top_vhd is 
			 port (
			 	--//input 						ufm_sn,
			 	ufm_sel	: in std_logic;		
			 	wb_clk_i: in std_logic;
			 	wb_rst_i: in std_logic;
			 	--//slave wishbone interface
			 	wb_sel_i:	in std_logic;
			 	wb_we_i :	in std_logic;
			 	
			 	wb_adr_i:	in std_logic_vector(7 downto 0);
			 	wb_dat_i:	in std_logic_vector(7 downto 0);
			 	wb_dat_o:	out std_logic_vector(7 downto 0);
			 	wb_stb_i: in	std_logic;
			 	wb_cyc_i: in	std_logic;
			 	wb_ack_o: out std_logic;
			  wb_int_req:out std_logic;
				--//Spi interface
			 	spiClkOut: out std_logic;
				spiDataIn: in	std_logic;	
				spiDataOut: out std_logic;
				spiCsn    : out std_logic
			 );
end 	spi_flash_controller_wl_top_vhd;

architecture RTL of spi_flash_controller_wl_top_vhd is

	component spi_flash_controller_wl_top
	port(
				--//input 						ufm_sn,
			 	ufm_sel	: in std_logic;		
			 	wb_clk_i: in std_logic;
			 	wb_rst_i: in std_logic;
			 	--//slave wishbone interface
			 	wb_sel_i:	in std_logic;
			 	wb_we_i :	in std_logic;
			 	
			 	wb_adr_i:	in std_logic_vector(7 downto 0);
			 	wb_dat_i:	in std_logic_vector(7 downto 0);
			 	wb_dat_o:	out std_logic_vector(7 downto 0);
			 	wb_stb_i: in	std_logic;
			 	wb_cyc_i: in	std_logic;
			 	wb_ack_o: out std_logic;
			  wb_int_req:out std_logic;
				--//Spi interface
			 	spiClkOut: out std_logic;
				spiDataIn: in	std_logic;	
				spiDataOut: out std_logic;
				spiCsn    : out std_logic
			); 
	end component;		
begin
		U : spi_flash_controller_wl_top
		port map
					(
						--//input 						ufm_sn,
			 	ufm_sel	 =>  ufm_sel	,
			 	wb_clk_i =>  wb_clk_i ,
			 	wb_rst_i =>  wb_rst_i ,
			 	--//slave wishbone interface
			 	wb_sel_i=>    wb_sel_i,
			 	wb_we_i =>    wb_we_i ,
			 	
			 	wb_adr_i => wb_adr_i,
			 	wb_dat_i => wb_dat_i,
			 	wb_dat_o => wb_dat_o,
			 	wb_stb_i => wb_stb_i,
			 	wb_cyc_i => wb_cyc_i,
			 	wb_ack_o => wb_ack_o,
			  wb_int_req => wb_int_req,
				--//Spi interface
			 	spiClkOut	=>spiClkOut	,
				spiDataIn	=>spiDataIn	,	
				spiDataOut=>spiDataOut,
				spiCsn    =>spiCsn    
					);
end  RTL;
