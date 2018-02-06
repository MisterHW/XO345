// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.4.1.213
// Netlist written on Sun Aug 16 21:12:46 2015
//
// Verilog Description of module ram_dp
//

module ram_dp (WrAddress, RdAddress, Data, WE, RdClock, RdClockEn, 
            Reset, WrClock, WrClockEn, Q) /* synthesis NGD_DRC_MASK=1 */ ;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(14[8:14])
    input [5:0]WrAddress;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(16[9:18])
    input [5:0]RdAddress;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(17[9:18])
    input [7:0]Data;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    input WE;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(19[9:11])
    input RdClock;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(20[9:16])
    input RdClockEn;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(21[9:18])
    input Reset;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(22[9:14])
    input WrClock;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(23[9:16])
    input WrClockEn;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(24[9:18])
    output [7:0]Q;   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    
    
    wire WrAddress_c_5, WrAddress_c_4, WrAddress_c_3, WrAddress_c_2, 
        WrAddress_c_1, WrAddress_c_0, RdAddress_c_5, RdAddress_c_4, 
        RdAddress_c_3, RdAddress_c_2, RdAddress_c_1, RdAddress_c_0, 
        Data_c_7, Data_c_6, Data_c_5, Data_c_4, Data_c_3, Data_c_2, 
        Data_c_1, Data_c_0, WE_c, RdClock_c, RdClockEn_c, Reset_c, 
        WrClock_c, WrClockEn_c, Q_c_7, Q_c_6, Q_c_5, Q_c_4, Q_c_3, 
        Q_c_2, Q_c_1, Q_c_0, scuba_vlo, VCC_net;
    
    VLO scuba_vlo_inst (.Z(scuba_vlo));
    DP8KC ram_dp_0_0_0 (.DIA0(Data_c_0), .DIA1(Data_c_1), .DIA2(Data_c_2), 
          .DIA3(Data_c_3), .DIA4(Data_c_4), .DIA5(Data_c_5), .DIA6(Data_c_6), 
          .DIA7(Data_c_7), .DIA8(scuba_vlo), .ADA0(VCC_net), .ADA1(scuba_vlo), 
          .ADA2(scuba_vlo), .ADA3(WrAddress_c_0), .ADA4(WrAddress_c_1), 
          .ADA5(WrAddress_c_2), .ADA6(WrAddress_c_3), .ADA7(WrAddress_c_4), 
          .ADA8(WrAddress_c_5), .ADA9(scuba_vlo), .ADA10(scuba_vlo), .ADA11(scuba_vlo), 
          .ADA12(scuba_vlo), .CEA(WrClockEn_c), .OCEA(WrClockEn_c), .CLKA(WrClock_c), 
          .WEA(WE_c), .CSA0(scuba_vlo), .CSA1(scuba_vlo), .CSA2(scuba_vlo), 
          .RSTA(Reset_c), .DIB0(scuba_vlo), .DIB1(scuba_vlo), .DIB2(scuba_vlo), 
          .DIB3(scuba_vlo), .DIB4(scuba_vlo), .DIB5(scuba_vlo), .DIB6(scuba_vlo), 
          .DIB7(scuba_vlo), .DIB8(scuba_vlo), .ADB0(scuba_vlo), .ADB1(scuba_vlo), 
          .ADB2(scuba_vlo), .ADB3(RdAddress_c_0), .ADB4(RdAddress_c_1), 
          .ADB5(RdAddress_c_2), .ADB6(RdAddress_c_3), .ADB7(RdAddress_c_4), 
          .ADB8(RdAddress_c_5), .ADB9(scuba_vlo), .ADB10(scuba_vlo), .ADB11(scuba_vlo), 
          .ADB12(scuba_vlo), .CEB(RdClockEn_c), .OCEB(RdClockEn_c), .CLKB(RdClock_c), 
          .WEB(scuba_vlo), .CSB0(scuba_vlo), .CSB1(scuba_vlo), .CSB2(scuba_vlo), 
          .RSTB(Reset_c), .DOB0(Q_c_0), .DOB1(Q_c_1), .DOB2(Q_c_2), 
          .DOB3(Q_c_3), .DOB4(Q_c_4), .DOB5(Q_c_5), .DOB6(Q_c_6), .DOB7(Q_c_7)) /* synthesis MEM_LPC_FILE="ram_dp.lpc", MEM_INIT_FILE="INIT_ALL_1s", syn_instantiated=1 */ ;
    defparam ram_dp_0_0_0.DATA_WIDTH_A = 9;
    defparam ram_dp_0_0_0.DATA_WIDTH_B = 9;
    defparam ram_dp_0_0_0.REGMODE_A = "NOREG";
    defparam ram_dp_0_0_0.REGMODE_B = "NOREG";
    defparam ram_dp_0_0_0.CSDECODE_A = "0b000";
    defparam ram_dp_0_0_0.CSDECODE_B = "0b000";
    defparam ram_dp_0_0_0.WRITEMODE_A = "NORMAL";
    defparam ram_dp_0_0_0.WRITEMODE_B = "NORMAL";
    defparam ram_dp_0_0_0.GSR = "ENABLED";
    defparam ram_dp_0_0_0.RESETMODE = "ASYNC";
    defparam ram_dp_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam ram_dp_0_0_0.INIT_DATA = "STATIC";
    defparam ram_dp_0_0_0.INITVAL_00 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_01 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_02 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_03 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_04 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_05 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_06 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_07 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_08 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_09 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_0A = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_0B = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_0C = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_0D = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_0E = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_0F = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_10 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_11 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_12 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_13 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_14 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_15 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_16 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_17 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_18 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_19 = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_1A = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_1B = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_1C = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_1D = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_1E = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    defparam ram_dp_0_0_0.INITVAL_1F = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    OB Q_pad_5 (.I(Q_c_5), .O(Q[5]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    OB Q_pad_6 (.I(Q_c_6), .O(Q[6]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    OB Q_pad_7 (.I(Q_c_7), .O(Q[7]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    OB Q_pad_4 (.I(Q_c_4), .O(Q[4]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    OB Q_pad_3 (.I(Q_c_3), .O(Q[3]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    OB Q_pad_2 (.I(Q_c_2), .O(Q[2]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    OB Q_pad_1 (.I(Q_c_1), .O(Q[1]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    OB Q_pad_0 (.I(Q_c_0), .O(Q[0]));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(25[9:10])
    IB WrAddress_pad_5 (.I(WrAddress[5]), .O(WrAddress_c_5));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(16[9:18])
    IB WrAddress_pad_4 (.I(WrAddress[4]), .O(WrAddress_c_4));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(16[9:18])
    IB WrAddress_pad_3 (.I(WrAddress[3]), .O(WrAddress_c_3));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(16[9:18])
    IB WrAddress_pad_2 (.I(WrAddress[2]), .O(WrAddress_c_2));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(16[9:18])
    IB WrAddress_pad_1 (.I(WrAddress[1]), .O(WrAddress_c_1));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(16[9:18])
    IB WrAddress_pad_0 (.I(WrAddress[0]), .O(WrAddress_c_0));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(16[9:18])
    IB RdAddress_pad_5 (.I(RdAddress[5]), .O(RdAddress_c_5));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(17[9:18])
    IB RdAddress_pad_4 (.I(RdAddress[4]), .O(RdAddress_c_4));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(17[9:18])
    IB RdAddress_pad_3 (.I(RdAddress[3]), .O(RdAddress_c_3));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(17[9:18])
    IB RdAddress_pad_2 (.I(RdAddress[2]), .O(RdAddress_c_2));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(17[9:18])
    IB RdAddress_pad_1 (.I(RdAddress[1]), .O(RdAddress_c_1));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(17[9:18])
    IB RdAddress_pad_0 (.I(RdAddress[0]), .O(RdAddress_c_0));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(17[9:18])
    IB Data_pad_7 (.I(Data[7]), .O(Data_c_7));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB Data_pad_6 (.I(Data[6]), .O(Data_c_6));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB Data_pad_5 (.I(Data[5]), .O(Data_c_5));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB Data_pad_4 (.I(Data[4]), .O(Data_c_4));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB Data_pad_3 (.I(Data[3]), .O(Data_c_3));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB Data_pad_2 (.I(Data[2]), .O(Data_c_2));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB Data_pad_1 (.I(Data[1]), .O(Data_c_1));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB Data_pad_0 (.I(Data[0]), .O(Data_c_0));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(18[9:13])
    IB WE_pad (.I(WE), .O(WE_c));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(19[9:11])
    IB RdClock_pad (.I(RdClock), .O(RdClock_c));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(20[9:16])
    IB RdClockEn_pad (.I(RdClockEn), .O(RdClockEn_c));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(21[9:18])
    IB Reset_pad (.I(Reset), .O(Reset_c));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(22[9:14])
    IB WrClock_pad (.I(WrClock), .O(WrClock_c));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(23[9:16])
    IB WrClockEn_pad (.I(WrClockEn), .O(WrClockEn_c));   // c:/projekte/hardware/lattice/ffss3/xo345/source/ram_dp.vhd(24[9:18])
    GSR GSR_INST (.GSR(VCC_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VHI i6 (.Z(VCC_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

