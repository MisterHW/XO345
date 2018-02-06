// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.4.1.213
// Netlist written on Wed Nov 04 16:23:49 2015
//
// Verilog Description of module fifo_dc1300E
//

module fifo_dc1300E (Data, WrClock, RdClock, WrEn, RdEn, Reset, 
            RPReset, Q, Empty, Full, AlmostEmpty, AlmostFull) /* synthesis NGD_DRC_MASK=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(14[8:20])
    input [7:0]Data;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    input WrClock;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(17[9:16])
    input RdClock;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(18[9:16])
    input WrEn;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(19[9:13])
    input RdEn;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(20[9:13])
    input Reset;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(21[9:14])
    input RPReset;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(22[9:16])
    output [7:0]Q;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    output Empty;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(24[9:14])
    output Full;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(25[9:13])
    output AlmostEmpty;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(26[9:20])
    output AlmostFull;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(27[9:19])
    
    
    wire Data_c_7, Data_c_6, Data_c_5, Data_c_4, Data_c_3, Data_c_2, 
        Data_c_1, Data_c_0, WrClock_c, RdClock_c, WrEn_c, RdEn_c, 
        Reset_c, RPReset_c, Q_c_7, Q_c_6, Q_c_5, Q_c_4, Q_c_3, 
        Q_c_2, Q_c_1, Q_c_0, Empty_c, Full_c, AlmostEmpty_c, AlmostFull_c, 
        scuba_vlo, VCC_net;
    
    VLO scuba_vlo_inst (.Z(scuba_vlo));
    FIFO8KB fifo_dc1300E_0_0 (.DI0(Data_c_0), .DI1(Data_c_1), .DI2(Data_c_2), 
            .DI3(Data_c_3), .DI4(Data_c_4), .DI5(Data_c_5), .DI6(Data_c_6), 
            .DI7(Data_c_7), .DI8(scuba_vlo), .DI9(scuba_vlo), .DI10(scuba_vlo), 
            .DI11(scuba_vlo), .DI12(scuba_vlo), .DI13(scuba_vlo), .DI14(scuba_vlo), 
            .DI15(scuba_vlo), .DI16(scuba_vlo), .DI17(scuba_vlo), .FULLI(Full_c), 
            .EMPTYI(Empty_c), .CSW1(VCC_net), .CSW0(VCC_net), .CSR1(VCC_net), 
            .CSR0(VCC_net), .WE(WrEn_c), .RE(RdEn_c), .ORE(RdEn_c), 
            .CLKW(WrClock_c), .CLKR(RdClock_c), .RST(Reset_c), .RPRST(RPReset_c), 
            .DO9(Q_c_0), .DO10(Q_c_1), .DO11(Q_c_2), .DO12(Q_c_3), .DO13(Q_c_4), 
            .DO14(Q_c_5), .DO15(Q_c_6), .DO16(Q_c_7), .EF(Empty_c), 
            .AEF(AlmostEmpty_c), .AFF(AlmostFull_c), .FF(Full_c)) /* synthesis syn_instantiated=1 */ ;
    defparam fifo_dc1300E_0_0.DATA_WIDTH_W = 18;
    defparam fifo_dc1300E_0_0.DATA_WIDTH_R = 18;
    defparam fifo_dc1300E_0_0.REGMODE = "NOREG";
    defparam fifo_dc1300E_0_0.RESETMODE = "ASYNC";
    defparam fifo_dc1300E_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam fifo_dc1300E_0_0.CSDECODE_W = "0b11";
    defparam fifo_dc1300E_0_0.CSDECODE_R = "0b11";
    defparam fifo_dc1300E_0_0.AEPOINTER = "0b00000100000000";
    defparam fifo_dc1300E_0_0.AEPOINTER1 = "0b00000100010000";
    defparam fifo_dc1300E_0_0.AFPOINTER = "0b00111100000000";
    defparam fifo_dc1300E_0_0.AFPOINTER1 = "0b00111011110000";
    defparam fifo_dc1300E_0_0.FULLPOINTER = "0b01000000000000";
    defparam fifo_dc1300E_0_0.FULLPOINTER1 = "0b00111111110000";
    defparam fifo_dc1300E_0_0.GSR = "DISABLED";
    OB Q_pad_0 (.I(Q_c_0), .O(Q[0]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    OB Q_pad_1 (.I(Q_c_1), .O(Q[1]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    OB Q_pad_2 (.I(Q_c_2), .O(Q[2]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    IB Data_pad_6 (.I(Data[6]), .O(Data_c_6));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    IB Data_pad_7 (.I(Data[7]), .O(Data_c_7));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    OB Q_pad_3 (.I(Q_c_3), .O(Q[3]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    OB AlmostFull_pad (.I(AlmostFull_c), .O(AlmostFull));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(27[9:19])
    OB Q_pad_4 (.I(Q_c_4), .O(Q[4]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    OB AlmostEmpty_pad (.I(AlmostEmpty_c), .O(AlmostEmpty));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(26[9:20])
    OB Q_pad_5 (.I(Q_c_5), .O(Q[5]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    OB Full_pad (.I(Full_c), .O(Full));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(25[9:13])
    OB Q_pad_6 (.I(Q_c_6), .O(Q[6]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    OB Empty_pad (.I(Empty_c), .O(Empty));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(24[9:14])
    OB Q_pad_7 (.I(Q_c_7), .O(Q[7]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(23[9:10])
    IB Data_pad_5 (.I(Data[5]), .O(Data_c_5));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    IB Data_pad_4 (.I(Data[4]), .O(Data_c_4));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    IB Data_pad_3 (.I(Data[3]), .O(Data_c_3));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    IB Data_pad_2 (.I(Data[2]), .O(Data_c_2));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    IB Data_pad_1 (.I(Data[1]), .O(Data_c_1));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    IB Data_pad_0 (.I(Data[0]), .O(Data_c_0));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(16[9:13])
    IB WrClock_pad (.I(WrClock), .O(WrClock_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(17[9:16])
    IB RdClock_pad (.I(RdClock), .O(RdClock_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(18[9:16])
    IB WrEn_pad (.I(WrEn), .O(WrEn_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(19[9:13])
    IB RdEn_pad (.I(RdEn), .O(RdEn_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(20[9:13])
    IB Reset_pad (.I(Reset), .O(Reset_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(21[9:14])
    IB RPReset_pad (.I(RPReset), .O(RPReset_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_dc1300e.vhd(22[9:16])
    GSR GSR_INST (.GSR(VCC_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VHI i134 (.Z(VCC_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

