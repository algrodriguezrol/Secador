/* Verilog netlist generated by SCUBA ispLever_v81_SP1_Build (34) */
/* Module Version: 6.1 */
/* C:\ispTOOLS8_1\ispfpga\bin\nt\scuba.exe -w -lang verilog -synth synplify -bus_exp 7 -bb -arch xo2c00 -type bram -wp 10 -rp 0011 -rdata_width 24 -data_width 24 -num_rows 8 -cascade -1 -mem_init0 -init_data DYNAMIC -e  */
/* Sun Sep 26 18:26:30 2010 */


`timescale 1 ns / 1 ps
module sector_erase_cnt_memory (WrAddress, RdAddress, Data, WE, RdClock, 
    RdClockEn, Reset, WrClock, WrClockEn, Q);
    input wire [2:0] WrAddress;
    input wire [2:0] RdAddress;
    input wire [23:0] Data;
    input wire WE;
    input wire RdClock;
    input wire RdClockEn;
    input wire Reset;
    input wire WrClock;
    input wire WrClockEn;
    output wire [23:0] Q;

    wire scuba_vhi;
    wire scuba_vlo;

    defparam sector_erase_cnt_memory_0_0_1.INIT_DATA = "DYNAMIC" ;
    defparam sector_erase_cnt_memory_0_0_1.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_0_1.CSDECODE_R = "0b000" ;
    defparam sector_erase_cnt_memory_0_0_1.CSDECODE_W = "0b001" ;
    defparam sector_erase_cnt_memory_0_0_1.GSR = "DISABLED" ;
    defparam sector_erase_cnt_memory_0_0_1.RESETMODE = "ASYNC" ;
    defparam sector_erase_cnt_memory_0_0_1.REGMODE = "NOREG" ;
    defparam sector_erase_cnt_memory_0_0_1.DATA_WIDTH_R = 18 ;
    defparam sector_erase_cnt_memory_0_0_1.DATA_WIDTH_W = 18 ;
    PDPW8KC sector_erase_cnt_memory_0_0_1 (.DI17(Data[17]), .DI16(Data[16]), 
        .DI15(Data[15]), .DI14(Data[14]), .DI13(Data[13]), .DI12(Data[12]), 
        .DI11(Data[11]), .DI10(Data[10]), .DI9(Data[9]), .DI8(Data[8]), 
        .DI7(Data[7]), .DI6(Data[6]), .DI5(Data[5]), .DI4(Data[4]), .DI3(Data[3]), 
        .DI2(Data[2]), .DI1(Data[1]), .DI0(Data[0]), .ADW8(scuba_vlo), .ADW7(scuba_vlo), 
        .ADW6(scuba_vlo), .ADW5(scuba_vlo), .ADW4(scuba_vlo), .ADW3(scuba_vlo), 
        .ADW2(WrAddress[2]), .ADW1(WrAddress[1]), .ADW0(WrAddress[0]), .BE1(scuba_vhi), 
        .BE0(scuba_vhi), .CEW(WrClockEn), .CLKW(WrClock), .CSW2(scuba_vlo), 
        .CSW1(scuba_vlo), .CSW0(WE), .ADR12(scuba_vlo), .ADR11(scuba_vlo), 
        .ADR10(scuba_vlo), .ADR9(scuba_vlo), .ADR8(scuba_vlo), .ADR7(scuba_vlo), 
        .ADR6(RdAddress[2]), .ADR5(RdAddress[1]), .ADR4(RdAddress[0]), .ADR3(scuba_vlo), 
        .ADR2(scuba_vlo), .ADR1(scuba_vlo), .ADR0(scuba_vlo), .CER(RdClockEn), 
        .OCER(RdClockEn), .CLKR(RdClock), .CSR2(scuba_vlo), .CSR1(scuba_vlo), 
        .CSR0(scuba_vlo), .RST(Reset), .DO17(Q[8]), .DO16(Q[7]), .DO15(Q[6]), 
        .DO14(Q[5]), .DO13(Q[4]), .DO12(Q[3]), .DO11(Q[2]), .DO10(Q[1]), 
        .DO9(Q[0]), .DO8(Q[17]), .DO7(Q[16]), .DO6(Q[15]), .DO5(Q[14]), 
        .DO4(Q[13]), .DO3(Q[12]), .DO2(Q[11]), .DO1(Q[10]), .DO0(Q[9]))
             /* synthesis MEM_LPC_FILE="sector_erase_cnt_memory.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    defparam sector_erase_cnt_memory_0_1_0.INIT_DATA = "DYNAMIC" ;
    defparam sector_erase_cnt_memory_0_1_0.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam sector_erase_cnt_memory_0_1_0.CSDECODE_R = "0b000" ;
    defparam sector_erase_cnt_memory_0_1_0.CSDECODE_W = "0b001" ;
    defparam sector_erase_cnt_memory_0_1_0.GSR = "DISABLED" ;
    defparam sector_erase_cnt_memory_0_1_0.RESETMODE = "ASYNC" ;
    defparam sector_erase_cnt_memory_0_1_0.REGMODE = "NOREG" ;
    defparam sector_erase_cnt_memory_0_1_0.DATA_WIDTH_R = 18 ;
    defparam sector_erase_cnt_memory_0_1_0.DATA_WIDTH_W = 18 ;
    PDPW8KC sector_erase_cnt_memory_0_1_0 (.DI17(scuba_vlo), .DI16(scuba_vlo), 
        .DI15(scuba_vlo), .DI14(scuba_vlo), .DI13(scuba_vlo), .DI12(scuba_vlo), 
        .DI11(scuba_vlo), .DI10(scuba_vlo), .DI9(scuba_vlo), .DI8(scuba_vlo), 
        .DI7(scuba_vlo), .DI6(scuba_vlo), .DI5(Data[23]), .DI4(Data[22]), 
        .DI3(Data[21]), .DI2(Data[20]), .DI1(Data[19]), .DI0(Data[18]), 
        .ADW8(scuba_vlo), .ADW7(scuba_vlo), .ADW6(scuba_vlo), .ADW5(scuba_vlo), 
        .ADW4(scuba_vlo), .ADW3(scuba_vlo), .ADW2(WrAddress[2]), .ADW1(WrAddress[1]), 
        .ADW0(WrAddress[0]), .BE1(scuba_vhi), .BE0(scuba_vhi), .CEW(WrClockEn), 
        .CLKW(WrClock), .CSW2(scuba_vlo), .CSW1(scuba_vlo), .CSW0(WE), .ADR12(scuba_vlo), 
        .ADR11(scuba_vlo), .ADR10(scuba_vlo), .ADR9(scuba_vlo), .ADR8(scuba_vlo), 
        .ADR7(scuba_vlo), .ADR6(RdAddress[2]), .ADR5(RdAddress[1]), .ADR4(RdAddress[0]), 
        .ADR3(scuba_vlo), .ADR2(scuba_vlo), .ADR1(scuba_vlo), .ADR0(scuba_vlo), 
        .CER(RdClockEn), .OCER(RdClockEn), .CLKR(RdClock), .CSR2(scuba_vlo), 
        .CSR1(scuba_vlo), .CSR0(scuba_vlo), .RST(Reset), .DO17(), .DO16(), 
        .DO15(), .DO14(Q[23]), .DO13(Q[22]), .DO12(Q[21]), .DO11(Q[20]), 
        .DO10(Q[19]), .DO9(Q[18]), .DO8(), .DO7(), .DO6(), .DO5(), .DO4(), 
        .DO3(), .DO2(), .DO1(), .DO0())
             /* synthesis MEM_LPC_FILE="sector_erase_cnt_memory.lpc" */
             /* synthesis MEM_INIT_FILE="INIT_ALL_0s" */;



    // exemplar begin
    // exemplar attribute sector_erase_cnt_memory_0_0_1 MEM_LPC_FILE sector_erase_cnt_memory.lpc
    // exemplar attribute sector_erase_cnt_memory_0_0_1 MEM_INIT_FILE INIT_ALL_0s
    // exemplar attribute sector_erase_cnt_memory_0_1_0 MEM_LPC_FILE sector_erase_cnt_memory.lpc
    // exemplar attribute sector_erase_cnt_memory_0_1_0 MEM_INIT_FILE INIT_ALL_0s
    // exemplar end

endmodule
