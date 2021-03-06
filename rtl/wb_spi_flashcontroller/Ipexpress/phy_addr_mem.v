/* Verilog netlist generated by SCUBA ispLever_v81_SP1_Build (34) */
/* Module Version: 6.1 */
/* C:\ispTOOLS8_1\ispfpga\bin\nt\scuba.exe -w -lang verilog -synth synplify -bus_exp 7 -bb -arch xo2c00 -type bram -wp 10 -rp 0011 -rdata_width 16 -data_width 16 -num_rows 2048 -cascade -1 -mem_init0 -init_data DYNAMIC -e  */
/* Sun Sep 26 16:03:35 2010 */


`timescale 1 ns / 1 ps
module phy_addr_mem (WrAddress, RdAddress, Data, WE, RdClock, RdClockEn, 
    Reset, WrClock, WrClockEn, Q);
    input wire [10:0] WrAddress;
    input wire [10:0] RdAddress;
    input wire [15:0] Data;
    input wire WE;
    input wire RdClock;
    input wire RdClockEn;
    input wire Reset;
    input wire WrClock;
    input wire WrClockEn;
    output wire [15:0] Q;

    wire scuba_vhi;
    wire scuba_vlo;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    defparam phy_addr_mem_0_0_3.INIT_DATA = "DYNAMIC" ;
    defparam phy_addr_mem_0_0_3.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam phy_addr_mem_0_0_3.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_0_3.CSDECODE_B = "0b000" ;
    defparam phy_addr_mem_0_0_3.CSDECODE_A = "0b000" ;
    defparam phy_addr_mem_0_0_3.WRITEMODE_B = "NORMAL" ;
    defparam phy_addr_mem_0_0_3.WRITEMODE_A = "NORMAL" ;
    defparam phy_addr_mem_0_0_3.GSR = "DISABLED" ;
    defparam phy_addr_mem_0_0_3.RESETMODE = "ASYNC" ;
    defparam phy_addr_mem_0_0_3.REGMODE_B = "NOREG" ;
    defparam phy_addr_mem_0_0_3.REGMODE_A = "NOREG" ;
    defparam phy_addr_mem_0_0_3.DATA_WIDTH_B = 4 ;
    defparam phy_addr_mem_0_0_3.DATA_WIDTH_A = 4 ;
    DP8KC phy_addr_mem_0_0_3 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(Data[3]), .DIA2(Data[2]), 
        .DIA1(Data[1]), .DIA0(Data[0]), .ADA12(WrAddress[10]), .ADA11(WrAddress[9]), 
        .ADA10(WrAddress[8]), .ADA9(WrAddress[7]), .ADA8(WrAddress[6]), 
        .ADA7(WrAddress[5]), .ADA6(WrAddress[4]), .ADA5(WrAddress[3]), .ADA4(WrAddress[2]), 
        .ADA3(WrAddress[1]), .ADA2(WrAddress[0]), .ADA1(scuba_vlo), .ADA0(scuba_vlo), 
        .CEA(WrClockEn), .OCEA(WrClockEn), .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(scuba_vlo), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(RdAddress[10]), .ADB11(RdAddress[9]), .ADB10(RdAddress[8]), 
        .ADB9(RdAddress[7]), .ADB8(RdAddress[6]), .ADB7(RdAddress[5]), .ADB6(RdAddress[4]), 
        .ADB5(RdAddress[3]), .ADB4(RdAddress[2]), .ADB3(RdAddress[1]), .ADB2(RdAddress[0]), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA8(), .DOA7(), .DOA6(), .DOA5(), 
        .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB8(), .DOB7(), .DOB6(), 
        .DOB5(), .DOB4(), .DOB3(Q[3]), .DOB2(Q[2]), .DOB1(Q[1]), .DOB0(Q[0]))
             /* synthesis MEM_LPC_FILE="phy_addr_mem.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    defparam phy_addr_mem_0_1_2.INIT_DATA = "DYNAMIC" ;
    defparam phy_addr_mem_0_1_2.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam phy_addr_mem_0_1_2.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_1_2.CSDECODE_B = "0b000" ;
    defparam phy_addr_mem_0_1_2.CSDECODE_A = "0b000" ;
    defparam phy_addr_mem_0_1_2.WRITEMODE_B = "NORMAL" ;
    defparam phy_addr_mem_0_1_2.WRITEMODE_A = "NORMAL" ;
    defparam phy_addr_mem_0_1_2.GSR = "DISABLED" ;
    defparam phy_addr_mem_0_1_2.RESETMODE = "ASYNC" ;
    defparam phy_addr_mem_0_1_2.REGMODE_B = "NOREG" ;
    defparam phy_addr_mem_0_1_2.REGMODE_A = "NOREG" ;
    defparam phy_addr_mem_0_1_2.DATA_WIDTH_B = 4 ;
    defparam phy_addr_mem_0_1_2.DATA_WIDTH_A = 4 ;
    DP8KC phy_addr_mem_0_1_2 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(Data[7]), .DIA2(Data[6]), 
        .DIA1(Data[5]), .DIA0(Data[4]), .ADA12(WrAddress[10]), .ADA11(WrAddress[9]), 
        .ADA10(WrAddress[8]), .ADA9(WrAddress[7]), .ADA8(WrAddress[6]), 
        .ADA7(WrAddress[5]), .ADA6(WrAddress[4]), .ADA5(WrAddress[3]), .ADA4(WrAddress[2]), 
        .ADA3(WrAddress[1]), .ADA2(WrAddress[0]), .ADA1(scuba_vlo), .ADA0(scuba_vlo), 
        .CEA(WrClockEn), .OCEA(WrClockEn), .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(scuba_vlo), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(RdAddress[10]), .ADB11(RdAddress[9]), .ADB10(RdAddress[8]), 
        .ADB9(RdAddress[7]), .ADB8(RdAddress[6]), .ADB7(RdAddress[5]), .ADB6(RdAddress[4]), 
        .ADB5(RdAddress[3]), .ADB4(RdAddress[2]), .ADB3(RdAddress[1]), .ADB2(RdAddress[0]), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA8(), .DOA7(), .DOA6(), .DOA5(), 
        .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB8(), .DOB7(), .DOB6(), 
        .DOB5(), .DOB4(), .DOB3(Q[7]), .DOB2(Q[6]), .DOB1(Q[5]), .DOB0(Q[4]))
             /* synthesis MEM_LPC_FILE="phy_addr_mem.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    defparam phy_addr_mem_0_2_1.INIT_DATA = "DYNAMIC" ;
    defparam phy_addr_mem_0_2_1.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam phy_addr_mem_0_2_1.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_2_1.CSDECODE_B = "0b000" ;
    defparam phy_addr_mem_0_2_1.CSDECODE_A = "0b000" ;
    defparam phy_addr_mem_0_2_1.WRITEMODE_B = "NORMAL" ;
    defparam phy_addr_mem_0_2_1.WRITEMODE_A = "NORMAL" ;
    defparam phy_addr_mem_0_2_1.GSR = "DISABLED" ;
    defparam phy_addr_mem_0_2_1.RESETMODE = "ASYNC" ;
    defparam phy_addr_mem_0_2_1.REGMODE_B = "NOREG" ;
    defparam phy_addr_mem_0_2_1.REGMODE_A = "NOREG" ;
    defparam phy_addr_mem_0_2_1.DATA_WIDTH_B = 4 ;
    defparam phy_addr_mem_0_2_1.DATA_WIDTH_A = 4 ;
    DP8KC phy_addr_mem_0_2_1 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(Data[11]), .DIA2(Data[10]), 
        .DIA1(Data[9]), .DIA0(Data[8]), .ADA12(WrAddress[10]), .ADA11(WrAddress[9]), 
        .ADA10(WrAddress[8]), .ADA9(WrAddress[7]), .ADA8(WrAddress[6]), 
        .ADA7(WrAddress[5]), .ADA6(WrAddress[4]), .ADA5(WrAddress[3]), .ADA4(WrAddress[2]), 
        .ADA3(WrAddress[1]), .ADA2(WrAddress[0]), .ADA1(scuba_vlo), .ADA0(scuba_vlo), 
        .CEA(WrClockEn), .OCEA(WrClockEn), .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(scuba_vlo), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(RdAddress[10]), .ADB11(RdAddress[9]), .ADB10(RdAddress[8]), 
        .ADB9(RdAddress[7]), .ADB8(RdAddress[6]), .ADB7(RdAddress[5]), .ADB6(RdAddress[4]), 
        .ADB5(RdAddress[3]), .ADB4(RdAddress[2]), .ADB3(RdAddress[1]), .ADB2(RdAddress[0]), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA8(), .DOA7(), .DOA6(), .DOA5(), 
        .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB8(), .DOB7(), .DOB6(), 
        .DOB5(), .DOB4(), .DOB3(Q[11]), .DOB2(Q[10]), .DOB1(Q[9]), .DOB0(Q[8]))
             /* synthesis MEM_LPC_FILE="phy_addr_mem.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    defparam phy_addr_mem_0_3_0.INIT_DATA = "DYNAMIC" ;
    defparam phy_addr_mem_0_3_0.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam phy_addr_mem_0_3_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam phy_addr_mem_0_3_0.CSDECODE_B = "0b000" ;
    defparam phy_addr_mem_0_3_0.CSDECODE_A = "0b000" ;
    defparam phy_addr_mem_0_3_0.WRITEMODE_B = "NORMAL" ;
    defparam phy_addr_mem_0_3_0.WRITEMODE_A = "NORMAL" ;
    defparam phy_addr_mem_0_3_0.GSR = "DISABLED" ;
    defparam phy_addr_mem_0_3_0.RESETMODE = "ASYNC" ;
    defparam phy_addr_mem_0_3_0.REGMODE_B = "NOREG" ;
    defparam phy_addr_mem_0_3_0.REGMODE_A = "NOREG" ;
    defparam phy_addr_mem_0_3_0.DATA_WIDTH_B = 4 ;
    defparam phy_addr_mem_0_3_0.DATA_WIDTH_A = 4 ;
    DP8KC phy_addr_mem_0_3_0 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(Data[15]), .DIA2(Data[14]), 
        .DIA1(Data[13]), .DIA0(Data[12]), .ADA12(WrAddress[10]), .ADA11(WrAddress[9]), 
        .ADA10(WrAddress[8]), .ADA9(WrAddress[7]), .ADA8(WrAddress[6]), 
        .ADA7(WrAddress[5]), .ADA6(WrAddress[4]), .ADA5(WrAddress[3]), .ADA4(WrAddress[2]), 
        .ADA3(WrAddress[1]), .ADA2(WrAddress[0]), .ADA1(scuba_vlo), .ADA0(scuba_vlo), 
        .CEA(WrClockEn), .OCEA(WrClockEn), .CLKA(WrClock), .WEA(WE), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(scuba_vlo), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(RdAddress[10]), .ADB11(RdAddress[9]), .ADB10(RdAddress[8]), 
        .ADB9(RdAddress[7]), .ADB8(RdAddress[6]), .ADB7(RdAddress[5]), .ADB6(RdAddress[4]), 
        .ADB5(RdAddress[3]), .ADB4(RdAddress[2]), .ADB3(RdAddress[1]), .ADB2(RdAddress[0]), 
        .ADB1(scuba_vlo), .ADB0(scuba_vlo), .CEB(RdClockEn), .OCEB(RdClockEn), 
        .CLKB(RdClock), .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), 
        .CSB0(scuba_vlo), .RSTB(Reset), .DOA8(), .DOA7(), .DOA6(), .DOA5(), 
        .DOA4(), .DOA3(), .DOA2(), .DOA1(), .DOA0(), .DOB8(), .DOB7(), .DOB6(), 
        .DOB5(), .DOB4(), .DOB3(Q[15]), .DOB2(Q[14]), .DOB1(Q[13]), .DOB0(Q[12]))
             /* synthesis MEM_LPC_FILE="phy_addr_mem.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;



    // exemplar begin
    // exemplar attribute phy_addr_mem_0_0_3 MEM_LPC_FILE phy_addr_mem.lpc
    // exemplar attribute phy_addr_mem_0_0_3 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute phy_addr_mem_0_1_2 MEM_LPC_FILE phy_addr_mem.lpc
    // exemplar attribute phy_addr_mem_0_1_2 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute phy_addr_mem_0_2_1 MEM_LPC_FILE phy_addr_mem.lpc
    // exemplar attribute phy_addr_mem_0_2_1 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute phy_addr_mem_0_3_0 MEM_LPC_FILE phy_addr_mem.lpc
    // exemplar attribute phy_addr_mem_0_3_0 MEM_INIT_FILE INIT_ALL_0s
    // exemplar end

endmodule
