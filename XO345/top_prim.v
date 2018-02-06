// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.4.1.213
// Netlist written on Fri Jan 29 16:02:49 2016
//
// Verilog Description of module top
//

module top (PARALLEL_RXFILLEDN, PARALLEL_TXENABLEDN, PARALLEL_PWREN, PARALLEL_DATA_IO, 
            PARALLEL_RDN, PARALLEL_WR, SPI_CSN, SPI_CLK, SPI_SDI, 
            SPI_SDOZ);   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(12[8:11])
    output PARALLEL_RXFILLEDN;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(16[3:21])
    output PARALLEL_TXENABLEDN;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(17[3:22])
    output PARALLEL_PWREN;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(18[3:17])
    inout [7:0]PARALLEL_DATA_IO;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(19[3:19])
    input PARALLEL_RDN;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(20[3:15])
    input PARALLEL_WR;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(21[3:14])
    input SPI_CSN;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(24[3:10])
    inout SPI_CLK /* synthesis black_box_pad_pin=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(25[3:10])
    inout SPI_SDI /* synthesis black_box_pad_pin=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(26[3:10])
    output SPI_SDOZ /* synthesis black_box_pad_pin=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(27[3:11])
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire n8481 /* synthesis nomerge= */ ;
    wire n8480 /* synthesis nomerge= */ ;
    wire [3:0]IRQ_adj_17;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(90[37:40])
    wire [7:0]GPI_1;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(75[37:42])
    
    wire PARALLEL_RXFILLEDN_c, PARALLEL_TXENABLEDN_c, PARALLEL_PWREN_c, 
        PARALLEL_RDN_c, PARALLEL_WR_c, SPI_CSN_c;
    wire [7:0]RXData;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(93[9:15])
    wire [7:0]TXData;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(94[9:15])
    wire [7:0]FIFOStatus;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(95[9:19])
    
    wire GP_Enable, MEM_WR, MEM_RD_FIRST, MEM_WR_ACTIVE;
    wire [7:0]MEM_ADDR;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(159[11:19])
    wire [7:0]GPO_Reg;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(168[9:16])
    
    wire RXFN_INHIBIT, RX_RdClock;
    wire [7:0]RX_Q;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(88[12:16])
    wire [3:0]n174;
    
    wire n200, spi_mosi_oe, spi_mosi_o, spi_miso_oe, spi_miso_o, spi_clk_oe, 
        spi_clk_o, spi_mosi_i, spi_miso_i, spi_clk_i, n6, n4067, 
        PARALLEL_DATA_IO_out_1, PARALLEL_DATA_IO_out_7, PARALLEL_DATA_IO_out_2, 
        PARALLEL_DATA_IO_out_3, n4017, PARALLEL_DATA_IO_out_4, PARALLEL_DATA_IO_out_5, 
        PARALLEL_DATA_IO_out_6, PARALLEL_DATA_IO_out_0, n3786, n68, 
        n8299;
    
    VHI i2 (.Z(GPI_1[7]));
    INV i6388 (.A(MAIN_CLK), .Z(RX_RdClock));
    OSCH INT_OSC (.STDBY(IRQ_adj_17[3]), .OSC(MAIN_CLK)) /* synthesis NOM_FREQ="33.25", syn_instantiated=1 */ ;
    defparam INT_OSC.NOM_FREQ = "33.25";
    GSR GSR_INST (.GSR(GPI_1[7])) /* synthesis syn_instantiated=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(188[12:15])
    BB BBspi_mosi (.I(spi_mosi_o), .T(spi_mosi_oe), .B(SPI_SDI), .O(spi_mosi_i)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=7, LSE_LCOL=18, LSE_RCOL=15, LSE_LLINE=145, LSE_RLINE=160 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_efb.v(40[8:82])
    BB BBspi_miso (.I(spi_miso_o), .T(spi_miso_oe), .B(SPI_SDOZ), .O(spi_miso_i)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=7, LSE_LCOL=18, LSE_RCOL=15, LSE_LLINE=145, LSE_RLINE=160 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_efb.v(42[8:82])
    BB BBspi_clk (.I(spi_clk_o), .T(spi_clk_oe), .B(SPI_CLK), .O(spi_clk_i)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=7, LSE_LCOL=18, LSE_RCOL=15, LSE_LLINE=145, LSE_RLINE=160 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_efb.v(44[8:77])
    LUT4 i5_1_lut (.A(GP_Enable), .Z(PARALLEL_PWREN_c)) /* synthesis lut_function=(!(A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(228[20:33])
    defparam i5_1_lut.init = 16'h5555;
    BB PARALLEL_DATA_IO_pad_5 (.I(RX_Q[5]), .T(n4017), .B(PARALLEL_DATA_IO[5]), 
       .O(PARALLEL_DATA_IO_out_5));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    BB PARALLEL_DATA_IO_pad_3 (.I(RX_Q[3]), .T(n4017), .B(PARALLEL_DATA_IO[3]), 
       .O(PARALLEL_DATA_IO_out_3));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    BB PARALLEL_DATA_IO_pad_4 (.I(RX_Q[4]), .T(n4017), .B(PARALLEL_DATA_IO[4]), 
       .O(PARALLEL_DATA_IO_out_4));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    BB PARALLEL_DATA_IO_pad_2 (.I(RX_Q[2]), .T(n4017), .B(PARALLEL_DATA_IO[2]), 
       .O(PARALLEL_DATA_IO_out_2));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    BB PARALLEL_DATA_IO_pad_1 (.I(RX_Q[1]), .T(n4017), .B(PARALLEL_DATA_IO[1]), 
       .O(PARALLEL_DATA_IO_out_1));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    BB PARALLEL_DATA_IO_pad_0 (.I(RX_Q[0]), .T(n4017), .B(PARALLEL_DATA_IO[0]), 
       .O(PARALLEL_DATA_IO_out_0));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    OB PARALLEL_RXFILLEDN_pad (.I(PARALLEL_RXFILLEDN_c), .O(PARALLEL_RXFILLEDN));   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(16[3:21])
    OB PARALLEL_TXENABLEDN_pad (.I(PARALLEL_TXENABLEDN_c), .O(PARALLEL_TXENABLEDN));   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(17[3:22])
    OB PARALLEL_PWREN_pad (.I(PARALLEL_PWREN_c), .O(PARALLEL_PWREN));   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(18[3:17])
    IB PARALLEL_RDN_pad (.I(PARALLEL_RDN), .O(PARALLEL_RDN_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(20[3:15])
    IB PARALLEL_WR_pad (.I(PARALLEL_WR), .O(PARALLEL_WR_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(21[3:14])
    IB SPI_CSN_pad (.I(SPI_CSN), .O(SPI_CSN_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(24[3:10])
    BB PARALLEL_DATA_IO_pad_6 (.I(RX_Q[6]), .T(n4017), .B(PARALLEL_DATA_IO[6]), 
       .O(PARALLEL_DATA_IO_out_6));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    LUT4 i12_3_lut (.A(MEM_WR_ACTIVE), .B(GPO_Reg[1]), .C(GPO_Reg[0]), 
         .Z(RXFN_INHIBIT)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(230[20:87])
    defparam i12_3_lut.init = 16'hcaca;
    LUT4 i6145_2_lut (.A(IRQ_adj_17[3]), .B(n6), .Z(n68)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i6145_2_lut.init = 16'h4444;
    \spi_slave_top(GPI_PORT_NUM=1,REVISION_ID=1)  spi_slave_top_inst (.MAIN_CLK(MAIN_CLK), 
            .POWERUP_RST(IRQ_adj_17[3]), .n8481(n8481), .GND_net(IRQ_adj_17[3]), 
            .SPI_CSN_c(SPI_CSN_c), .spi_mosi_oe(spi_mosi_oe), .spi_mosi_o(spi_mosi_o), 
            .spi_miso_oe(spi_miso_oe), .spi_miso_o(spi_miso_o), .spi_clk_oe(spi_clk_oe), 
            .spi_clk_o(spi_clk_o), .spi_mosi_i(spi_mosi_i), .spi_miso_i(spi_miso_i), 
            .spi_clk_i(spi_clk_i), .VCC_net(GPI_1[7]), .RXData({RXData}), 
            .MEM_ADDR({MEM_ADDR}), .TXData({TXData}), .GP_Enable(GP_Enable), 
            .MEM_RD_FIRST(MEM_RD_FIRST), .MEM_WR_ACTIVE(MEM_WR_ACTIVE), 
            .MEM_WR(MEM_WR), .FIFOStatus({FIFOStatus}), .\GPO_Reg[1] (GPO_Reg[1]), 
            .\GPO_Reg[0] (GPO_Reg[0])) /* synthesis syn_module_defined=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(260[23:36])
    BB PARALLEL_DATA_IO_pad_7 (.I(RX_Q[7]), .T(n4017), .B(PARALLEL_DATA_IO[7]), 
       .O(PARALLEL_DATA_IO_out_7));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(180[2] 187[14])
    VLO i1 (.Z(IRQ_adj_17[3]));
    PUR PUR_INST (.PUR(GPI_1[7]));
    defparam PUR_INST.RST_PULSE = 1;
    LUT4 i4_1_lut_rep_136 (.A(IRQ_adj_17[3]), .Z(n8299)) /* synthesis lut_function=(!(A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(205[11:26])
    defparam i4_1_lut_rep_136.init = 16'h5555;
    LUT4 i47_2_lut_2_lut (.A(IRQ_adj_17[3]), .B(MEM_RD_FIRST), .Z(n200)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(205[11:26])
    defparam i47_2_lut_2_lut.init = 16'h4444;
    LUT4 i2325_2_lut_2_lut (.A(IRQ_adj_17[3]), .B(n174[0]), .Z(n4067)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(205[11:26])
    defparam i2325_2_lut_2_lut.init = 16'h4444;
    LUT4 i2111_2_lut_2_lut (.A(IRQ_adj_17[3]), .B(n174[1]), .Z(n3786)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(205[11:26])
    defparam i2111_2_lut_2_lut.init = 16'h4444;
    LUT4 m1_lut (.Z(n8481)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    LUT4 m0_lut (.Z(n8480)) /* synthesis lut_function=0, syn_instantiated=1 */ ;
    defparam m0_lut.init = 16'h0000;
    fifo_ctrl fifo_ctrl_inst (.MAIN_CLK(MAIN_CLK), .VCC_net(GPI_1[7]), .GND_net(IRQ_adj_17[3]), 
            .PARALLEL_DATA_IO_out_4(PARALLEL_DATA_IO_out_4), .RX_RdClock(RX_RdClock), 
            .MEM_WR(MEM_WR), .PARALLEL_WR_c(PARALLEL_WR_c), .PARALLEL_RDN_c(PARALLEL_RDN_c), 
            .PARALLEL_DATA_IO_out_1(PARALLEL_DATA_IO_out_1), .PARALLEL_DATA_IO_out_0(PARALLEL_DATA_IO_out_0), 
            .PARALLEL_DATA_IO_out_6(PARALLEL_DATA_IO_out_6), .PARALLEL_RXFILLEDN_c(PARALLEL_RXFILLEDN_c), 
            .PARALLEL_DATA_IO_out_5(PARALLEL_DATA_IO_out_5), .PARALLEL_DATA_IO_out_7(PARALLEL_DATA_IO_out_7), 
            .PARALLEL_DATA_IO_out_3(PARALLEL_DATA_IO_out_3), .PARALLEL_DATA_IO_out_2(PARALLEL_DATA_IO_out_2), 
            .n4017(n4017), .n8299(n8299), .n68(n68), .POWERUP_RST(IRQ_adj_17[3]), 
            .n8481(n8481), .n6(n6), .FIFOStatus({FIFOStatus}), .PARALLEL_TXENABLEDN_c(PARALLEL_TXENABLEDN_c), 
            .n200(n200), .MEM_ADDR({MEM_ADDR}), .n178(n174[0]), .n3786(n3786), 
            .n8480(n8480), .n177(n174[1]), .n4067(n4067), .TXData({TXData}), 
            .RXData({RXData}), .RX_Q({RX_Q}), .RXFN_INHIBIT(RXFN_INHIBIT));   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(237[19:28])
    
endmodule
//
// Verilog Description of module \spi_slave_top(GPI_PORT_NUM=1,REVISION_ID=1) 
//

module \spi_slave_top(GPI_PORT_NUM=1,REVISION_ID=1)  (MAIN_CLK, POWERUP_RST, 
            n8481, GND_net, SPI_CSN_c, spi_mosi_oe, spi_mosi_o, spi_miso_oe, 
            spi_miso_o, spi_clk_oe, spi_clk_o, spi_mosi_i, spi_miso_i, 
            spi_clk_i, VCC_net, RXData, MEM_ADDR, TXData, GP_Enable, 
            MEM_RD_FIRST, MEM_WR_ACTIVE, MEM_WR, FIFOStatus, \GPO_Reg[1] , 
            \GPO_Reg[0] ) /* synthesis syn_module_defined=1 */ ;
    input MAIN_CLK;
    input POWERUP_RST;
    input n8481;
    input GND_net;
    input SPI_CSN_c;
    output spi_mosi_oe;
    output spi_mosi_o;
    output spi_miso_oe;
    output spi_miso_o;
    output spi_clk_oe;
    output spi_clk_o;
    input spi_mosi_i;
    input spi_miso_i;
    input spi_clk_i;
    input VCC_net;
    output [7:0]RXData;
    output [7:0]MEM_ADDR;
    input [7:0]TXData;
    output GP_Enable;
    output MEM_RD_FIRST;
    output MEM_WR_ACTIVE;
    output MEM_WR;
    input [7:0]FIFOStatus;
    output \GPO_Reg[1] ;
    output \GPO_Reg[0] ;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire n8481 /* synthesis nomerge= */ ;
    
    wire wb_cyc_i;
    wire [7:0]wb_adr_i;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(103[43:51])
    wire [7:0]address;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(108[43:50])
    
    wire wb_stb_i, wb_we_i;
    wire [7:0]wb_dat_i;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(104[43:51])
    wire [7:0]wr_data;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(110[43:50])
    
    wire wb_sm, n8284, wb_ack_o, wr_en, rd_en, n8262;
    wire [7:0]wb_dat_o;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(105[43:51])
    
    wire n8294, n8288, n7810, n8298, n4695, n146, n4698;
    wire [7:0]gpio_addr;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(119[43:52])
    wire [7:0]gpio_dout;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(120[43:52])
    wire [7:0]gpio_din;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(121[43:51])
    
    wire gpi_ld;
    
    wb_ctrl wb_ctrl_inst (.wb_cyc_i(wb_cyc_i), .MAIN_CLK(MAIN_CLK), .POWERUP_RST(POWERUP_RST), 
            .\wb_adr_i[0] (wb_adr_i[0]), .\address[0] (address[0]), .wb_stb_i(wb_stb_i), 
            .wb_we_i(wb_we_i), .wb_dat_i({wb_dat_i}), .wr_data({wr_data}), 
            .wb_sm(wb_sm), .n8284(n8284), .wb_ack_o(wb_ack_o), .wr_en(wr_en), 
            .\wb_adr_i[4] (wb_adr_i[4]), .n8481(n8481), .\wb_adr_i[1] (wb_adr_i[1]), 
            .\address[1] (address[1]), .rd_en(rd_en), .n8262(n8262)) /* synthesis syn_module_defined=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(163[12] 180[15])
    spi_slave_efb sspi_efb_inst (.MAIN_CLK(MAIN_CLK), .POWERUP_RST(POWERUP_RST), 
            .wb_cyc_i(wb_cyc_i), .wb_stb_i(wb_stb_i), .wb_we_i(wb_we_i), 
            .GND_net(GND_net), .\wb_adr_i[4] (wb_adr_i[4]), .\wb_adr_i[1] (wb_adr_i[1]), 
            .\wb_adr_i[0] (wb_adr_i[0]), .wb_dat_i({wb_dat_i}), .SPI_CSN_c(SPI_CSN_c), 
            .wb_dat_o({wb_dat_o}), .wb_ack_o(wb_ack_o), .spi_mosi_oe(spi_mosi_oe), 
            .spi_mosi_o(spi_mosi_o), .spi_miso_oe(spi_miso_oe), .spi_miso_o(spi_miso_o), 
            .spi_clk_oe(spi_clk_oe), .spi_clk_o(spi_clk_o), .spi_mosi_i(spi_mosi_i), 
            .spi_miso_i(spi_miso_i), .spi_clk_i(spi_clk_i), .VCC_net(VCC_net), 
            .n8294(n8294), .n8288(n8288), .n7810(n7810), .n8298(n8298), 
            .n4695(n4695), .n146(n146), .n4698(n4698)) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(145[18] 160[15])
    \main_ctrl(GPI_PORT_NUM=1,REVISION_ID=1,MAX_MEM_BURST_NUM=256)  main_ctrl_inst (.MAIN_CLK(MAIN_CLK), 
            .POWERUP_RST(POWERUP_RST), .wb_dat_o({wb_dat_o}), .\address[0] (address[0]), 
            .rd_en(rd_en), .wr_en(wr_en), .gpio_addr({gpio_addr}), .\gpio_dout[0] (gpio_dout[0]), 
            .RXData({RXData}), .VCC_net(VCC_net), .SPI_CSN_c(SPI_CSN_c), 
            .wb_ack_o(wb_ack_o), .GND_net(GND_net), .MEM_ADDR({MEM_ADDR}), 
            .gpio_din({gpio_din}), .TXData({TXData}), .GP_Enable(GP_Enable), 
            .gpi_ld(gpi_ld), .MEM_RD_FIRST(MEM_RD_FIRST), .wr_data({wr_data}), 
            .\gpio_dout[1] (gpio_dout[1]), .\address[1] (address[1]), .n4698(n4698), 
            .MEM_WR_ACTIVE(MEM_WR_ACTIVE), .MEM_WR(MEM_WR), .n8262(n8262), 
            .n146(n146), .n4695(n4695), .n8288(n8288), .n8298(n8298), 
            .n8294(n8294), .n7810(n7810), .n8284(n8284), .wb_sm(wb_sm)) /* synthesis syn_module_defined=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(193[4] 220[21])
    ext_if ext_if_inst (.MAIN_CLK(MAIN_CLK), .POWERUP_RST(POWERUP_RST), 
           .gpi_ld(gpi_ld), .gpio_din({gpio_din}), .FIFOStatus({FIFOStatus}), 
           .\GPO_Reg[1] (\GPO_Reg[1] ), .\gpio_dout[1] (gpio_dout[1]), .\GPO_Reg[0] (\GPO_Reg[0] ), 
           .\gpio_dout[0] (gpio_dout[0]), .gpio_addr({gpio_addr})) /* synthesis syn_module_defined=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(232[4] 258[18])
    
endmodule
//
// Verilog Description of module wb_ctrl
//

module wb_ctrl (wb_cyc_i, MAIN_CLK, POWERUP_RST, \wb_adr_i[0] , \address[0] , 
            wb_stb_i, wb_we_i, wb_dat_i, wr_data, wb_sm, n8284, 
            wb_ack_o, wr_en, \wb_adr_i[4] , n8481, \wb_adr_i[1] , 
            \address[1] , rd_en, n8262) /* synthesis syn_module_defined=1 */ ;
    output wb_cyc_i;
    input MAIN_CLK;
    input POWERUP_RST;
    output \wb_adr_i[0] ;
    input \address[0] ;
    output wb_stb_i;
    output wb_we_i;
    output [7:0]wb_dat_i;
    input [7:0]wr_data;
    output wb_sm;
    output n8284;
    input wb_ack_o;
    input wr_en;
    output \wb_adr_i[4] ;
    input n8481;
    output \wb_adr_i[1] ;
    input \address[1] ;
    input rd_en;
    output n8262;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire n8481 /* synthesis nomerge= */ ;
    
    wire n4966, n4345, n4949, n4964, n4075, n7308;
    
    FD1S3DX wb_cyc_i_36 (.D(n4966), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(wb_cyc_i)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_cyc_i_36.GSR = "DISABLED";
    FD1P3DX wb_adr_i_i0 (.D(\address[0] ), .SP(n4345), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(\wb_adr_i[0] )) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_adr_i_i0.GSR = "DISABLED";
    FD1S3DX wb_stb_i_37 (.D(n4949), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(wb_stb_i)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_stb_i_37.GSR = "DISABLED";
    FD1S3DX wb_we_i_38 (.D(n4964), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(wb_we_i)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_we_i_38.GSR = "DISABLED";
    FD1P3DX wb_dat_i_i0 (.D(wr_data[0]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i0.GSR = "DISABLED";
    FD1S3DX wb_sm_35 (.D(n7308), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(wb_sm)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(83[11] 90[18])
    defparam wb_sm_35.GSR = "DISABLED";
    LUT4 i3170_4_lut (.A(n8284), .B(wb_cyc_i), .C(wb_sm), .D(wb_ack_o), 
         .Z(n4966)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam i3170_4_lut.init = 16'h0aca;
    LUT4 i3153_4_lut (.A(n8284), .B(wb_stb_i), .C(wb_sm), .D(wb_ack_o), 
         .Z(n4949)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam i3153_4_lut.init = 16'h0aca;
    LUT4 i3168_4_lut (.A(wr_en), .B(wb_we_i), .C(wb_sm), .D(wb_ack_o), 
         .Z(n4964)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam i3168_4_lut.init = 16'h0aca;
    LUT4 i2333_2_lut (.A(wr_en), .B(wb_sm), .Z(n4075)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam i2333_2_lut.init = 16'h2222;
    FD1P3DX wb_dat_i_i7 (.D(wr_data[7]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[7])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i7.GSR = "DISABLED";
    FD1P3DX wb_dat_i_i6 (.D(wr_data[6]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[6])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i6.GSR = "DISABLED";
    FD1P3DX wb_dat_i_i5 (.D(wr_data[5]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[5])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i5.GSR = "DISABLED";
    FD1P3DX wb_dat_i_i4 (.D(wr_data[4]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[4])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i4.GSR = "DISABLED";
    FD1P3DX wb_dat_i_i3 (.D(wr_data[3]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i3.GSR = "DISABLED";
    FD1P3DX wb_dat_i_i2 (.D(wr_data[2]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i2.GSR = "DISABLED";
    FD1P3DX wb_dat_i_i1 (.D(wr_data[1]), .SP(n4075), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wb_dat_i[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_dat_i_i1.GSR = "DISABLED";
    FD1P3DX wb_adr_i_i4 (.D(n8481), .SP(n4345), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(\wb_adr_i[4] )) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_adr_i_i4.GSR = "DISABLED";
    FD1P3DX wb_adr_i_i1 (.D(\address[1] ), .SP(n4345), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(\wb_adr_i[1] )) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=12, LSE_RCOL=15, LSE_LLINE=163, LSE_RLINE=180 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(101[11] 125[18])
    defparam wb_adr_i_i1.GSR = "DISABLED";
    LUT4 i4324_2_lut_rep_121 (.A(rd_en), .B(wr_en), .Z(n8284)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(108[29] 117[23])
    defparam i4324_2_lut_rep_121.init = 16'heeee;
    LUT4 i74_3_lut_rep_99_4_lut (.A(rd_en), .B(wr_en), .C(wb_sm), .D(wb_ack_o), 
         .Z(n8262)) /* synthesis lut_function=(A (C (D))+!A (B (C (D))+!B ((D)+!C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(108[29] 117[23])
    defparam i74_3_lut_rep_99_4_lut.init = 16'hf101;
    LUT4 i2597_2_lut_3_lut (.A(rd_en), .B(wr_en), .C(wb_sm), .Z(n4345)) /* synthesis lut_function=(!(A (C)+!A ((C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(108[29] 117[23])
    defparam i2597_2_lut_3_lut.init = 16'h0e0e;
    LUT4 i5495_3_lut_4_lut (.A(rd_en), .B(wr_en), .C(wb_sm), .D(wb_ack_o), 
         .Z(n7308)) /* synthesis lut_function=(!(A (C (D))+!A (B (C (D))+!B ((D)+!C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/wb_ctrl.v(108[29] 117[23])
    defparam i5495_3_lut_4_lut.init = 16'h0efe;
    
endmodule
//
// Verilog Description of module spi_slave_efb
//

module spi_slave_efb (MAIN_CLK, POWERUP_RST, wb_cyc_i, wb_stb_i, wb_we_i, 
            GND_net, \wb_adr_i[4] , \wb_adr_i[1] , \wb_adr_i[0] , wb_dat_i, 
            SPI_CSN_c, wb_dat_o, wb_ack_o, spi_mosi_oe, spi_mosi_o, 
            spi_miso_oe, spi_miso_o, spi_clk_oe, spi_clk_o, spi_mosi_i, 
            spi_miso_i, spi_clk_i, VCC_net, n8294, n8288, n7810, 
            n8298, n4695, n146, n4698) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;
    input MAIN_CLK;
    input POWERUP_RST;
    input wb_cyc_i;
    input wb_stb_i;
    input wb_we_i;
    input GND_net;
    input \wb_adr_i[4] ;
    input \wb_adr_i[1] ;
    input \wb_adr_i[0] ;
    input [7:0]wb_dat_i;
    input SPI_CSN_c;
    output [7:0]wb_dat_o;
    output wb_ack_o;
    output spi_mosi_oe;
    output spi_mosi_o;
    output spi_miso_oe;
    output spi_miso_o;
    output spi_clk_oe;
    output spi_clk_o;
    input spi_mosi_i;
    input spi_miso_i;
    input spi_clk_i;
    input VCC_net;
    output n8294;
    output n8288;
    output n7810;
    output n8298;
    input n4695;
    input n146;
    output n4698;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    
    EFB EFBInst_0 (.WBCLKI(MAIN_CLK), .WBRSTI(POWERUP_RST), .WBCYCI(wb_cyc_i), 
        .WBSTBI(wb_stb_i), .WBWEI(wb_we_i), .WBADRI0(\wb_adr_i[0] ), .WBADRI1(\wb_adr_i[1] ), 
        .WBADRI2(GND_net), .WBADRI3(\wb_adr_i[4] ), .WBADRI4(\wb_adr_i[4] ), 
        .WBADRI5(GND_net), .WBADRI6(\wb_adr_i[4] ), .WBADRI7(GND_net), 
        .WBDATI0(wb_dat_i[0]), .WBDATI1(wb_dat_i[1]), .WBDATI2(wb_dat_i[2]), 
        .WBDATI3(wb_dat_i[3]), .WBDATI4(wb_dat_i[4]), .WBDATI5(wb_dat_i[5]), 
        .WBDATI6(wb_dat_i[6]), .WBDATI7(wb_dat_i[7]), .I2C1SCLI(GND_net), 
        .I2C1SDAI(GND_net), .I2C2SCLI(GND_net), .I2C2SDAI(GND_net), .SPISCKI(spi_clk_i), 
        .SPIMISOI(spi_miso_i), .SPIMOSII(spi_mosi_i), .SPISCSN(SPI_CSN_c), 
        .TCCLKI(GND_net), .TCRSTN(GND_net), .TCIC(GND_net), .UFMSN(VCC_net), 
        .PLL0DATI0(GND_net), .PLL0DATI1(GND_net), .PLL0DATI2(GND_net), 
        .PLL0DATI3(GND_net), .PLL0DATI4(GND_net), .PLL0DATI5(GND_net), 
        .PLL0DATI6(GND_net), .PLL0DATI7(GND_net), .PLL0ACKI(GND_net), 
        .PLL1DATI0(GND_net), .PLL1DATI1(GND_net), .PLL1DATI2(GND_net), 
        .PLL1DATI3(GND_net), .PLL1DATI4(GND_net), .PLL1DATI5(GND_net), 
        .PLL1DATI6(GND_net), .PLL1DATI7(GND_net), .PLL1ACKI(GND_net), 
        .WBDATO0(wb_dat_o[0]), .WBDATO1(wb_dat_o[1]), .WBDATO2(wb_dat_o[2]), 
        .WBDATO3(wb_dat_o[3]), .WBDATO4(wb_dat_o[4]), .WBDATO5(wb_dat_o[5]), 
        .WBDATO6(wb_dat_o[6]), .WBDATO7(wb_dat_o[7]), .WBACKO(wb_ack_o), 
        .SPISCKO(spi_clk_o), .SPISCKEN(spi_clk_oe), .SPIMISOO(spi_miso_o), 
        .SPIMISOEN(spi_miso_oe), .SPIMOSIO(spi_mosi_o), .SPIMOSIEN(spi_mosi_oe)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=7, LSE_LCOL=18, LSE_RCOL=15, LSE_LLINE=145, LSE_RLINE=160 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(145[18] 160[15])
    defparam EFBInst_0.EFB_I2C1 = "DISABLED";
    defparam EFBInst_0.EFB_I2C2 = "DISABLED";
    defparam EFBInst_0.EFB_SPI = "ENABLED";
    defparam EFBInst_0.EFB_TC = "DISABLED";
    defparam EFBInst_0.EFB_TC_PORTMODE = "WB";
    defparam EFBInst_0.EFB_UFM = "DISABLED";
    defparam EFBInst_0.EFB_WB_CLK_FREQ = "50.0";
    defparam EFBInst_0.DEV_DENSITY = "6900L";
    defparam EFBInst_0.UFM_INIT_PAGES = 0;
    defparam EFBInst_0.UFM_INIT_START_PAGE = 0;
    defparam EFBInst_0.UFM_INIT_ALL_ZEROS = "ENABLED";
    defparam EFBInst_0.UFM_INIT_FILE_NAME = "NONE";
    defparam EFBInst_0.UFM_INIT_FILE_FORMAT = "HEX";
    defparam EFBInst_0.I2C1_ADDRESSING = "7BIT";
    defparam EFBInst_0.I2C2_ADDRESSING = "7BIT";
    defparam EFBInst_0.I2C1_SLAVE_ADDR = "0b1000001";
    defparam EFBInst_0.I2C2_SLAVE_ADDR = "0b1000010";
    defparam EFBInst_0.I2C1_BUS_PERF = "100kHz";
    defparam EFBInst_0.I2C2_BUS_PERF = "100kHz";
    defparam EFBInst_0.I2C1_CLK_DIVIDER = 1;
    defparam EFBInst_0.I2C2_CLK_DIVIDER = 1;
    defparam EFBInst_0.I2C1_GEN_CALL = "DISABLED";
    defparam EFBInst_0.I2C2_GEN_CALL = "DISABLED";
    defparam EFBInst_0.I2C1_WAKEUP = "DISABLED";
    defparam EFBInst_0.I2C2_WAKEUP = "DISABLED";
    defparam EFBInst_0.SPI_MODE = "SLAVE";
    defparam EFBInst_0.SPI_CLK_DIVIDER = 1;
    defparam EFBInst_0.SPI_LSB_FIRST = "DISABLED";
    defparam EFBInst_0.SPI_CLK_INV = "DISABLED";
    defparam EFBInst_0.SPI_PHASE_ADJ = "DISABLED";
    defparam EFBInst_0.SPI_SLAVE_HANDSHAKE = "DISABLED";
    defparam EFBInst_0.SPI_INTR_TXRDY = "DISABLED";
    defparam EFBInst_0.SPI_INTR_RXRDY = "ENABLED";
    defparam EFBInst_0.SPI_INTR_TXOVR = "DISABLED";
    defparam EFBInst_0.SPI_INTR_RXOVR = "DISABLED";
    defparam EFBInst_0.SPI_WAKEUP = "DISABLED";
    defparam EFBInst_0.TC_MODE = "CTCM";
    defparam EFBInst_0.TC_SCLK_SEL = "PCLOCK";
    defparam EFBInst_0.TC_CCLK_SEL = 1;
    defparam EFBInst_0.GSR = "ENABLED";
    defparam EFBInst_0.TC_TOP_SET = 65535;
    defparam EFBInst_0.TC_OCR_SET = 32767;
    defparam EFBInst_0.TC_OC_MODE = "TOGGLE";
    defparam EFBInst_0.TC_RESETN = "ENABLED";
    defparam EFBInst_0.TC_TOP_SEL = "OFF";
    defparam EFBInst_0.TC_OV_INT = "OFF";
    defparam EFBInst_0.TC_OCR_INT = "OFF";
    defparam EFBInst_0.TC_ICR_INT = "OFF";
    defparam EFBInst_0.TC_OVERFLOW = "DISABLED";
    defparam EFBInst_0.TC_ICAPTURE = "DISABLED";
    LUT4 i1_2_lut_rep_131 (.A(wb_dat_o[4]), .B(wb_dat_o[7]), .Z(n8294)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(145[18] 160[15])
    defparam i1_2_lut_rep_131.init = 16'heeee;
    LUT4 i2_3_lut_rep_125_4_lut (.A(wb_dat_o[4]), .B(wb_dat_o[7]), .C(wb_dat_o[6]), 
         .D(wb_dat_o[5]), .Z(n8288)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(145[18] 160[15])
    defparam i2_3_lut_rep_125_4_lut.init = 16'hfffe;
    LUT4 i1_3_lut_4_lut (.A(wb_dat_o[4]), .B(wb_dat_o[7]), .C(wb_dat_o[5]), 
         .D(wb_dat_o[6]), .Z(n7810)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(145[18] 160[15])
    defparam i1_3_lut_4_lut.init = 16'hefff;
    LUT4 i1_2_lut_rep_135 (.A(wb_dat_o[3]), .B(wb_dat_o[2]), .Z(n8298)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(145[18] 160[15])
    defparam i1_2_lut_rep_135.init = 16'h4444;
    LUT4 i1_3_lut_4_lut_adj_56 (.A(wb_dat_o[3]), .B(wb_dat_o[2]), .C(n4695), 
         .D(n146), .Z(n4698)) /* synthesis lut_function=(A (D)+!A (B ((D)+!C)+!B (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(145[18] 160[15])
    defparam i1_3_lut_4_lut_adj_56.init = 16'hff04;
    
endmodule
//
// Verilog Description of module \main_ctrl(GPI_PORT_NUM=1,REVISION_ID=1,MAX_MEM_BURST_NUM=256) 
//

module \main_ctrl(GPI_PORT_NUM=1,REVISION_ID=1,MAX_MEM_BURST_NUM=256)  (MAIN_CLK, 
            POWERUP_RST, wb_dat_o, \address[0] , rd_en, wr_en, gpio_addr, 
            \gpio_dout[0] , RXData, VCC_net, SPI_CSN_c, wb_ack_o, 
            GND_net, MEM_ADDR, gpio_din, TXData, GP_Enable, gpi_ld, 
            MEM_RD_FIRST, wr_data, \gpio_dout[1] , \address[1] , n4698, 
            MEM_WR_ACTIVE, MEM_WR, n8262, n146, n4695, n8288, n8298, 
            n8294, n7810, n8284, wb_sm) /* synthesis syn_module_defined=1 */ ;
    input MAIN_CLK;
    input POWERUP_RST;
    input [7:0]wb_dat_o;
    output \address[0] ;
    output rd_en;
    output wr_en;
    output [7:0]gpio_addr;
    output \gpio_dout[0] ;
    output [7:0]RXData;
    input VCC_net;
    input SPI_CSN_c;
    input wb_ack_o;
    input GND_net;
    output [7:0]MEM_ADDR;
    input [7:0]gpio_din;
    input [7:0]TXData;
    output GP_Enable;
    output gpi_ld;
    output MEM_RD_FIRST;
    output [7:0]wr_data;
    output \gpio_dout[1] ;
    output \address[1] ;
    input n4698;
    output MEM_WR_ACTIVE;
    output MEM_WR;
    input n8262;
    output n146;
    output n4695;
    input n8288;
    input n8298;
    input n8294;
    input n7810;
    input n8284;
    input wb_sm;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire [3:0]spi_cmd;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(149[16:23])
    
    wire n444, n7733;
    wire [3:0]irq_en;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(127[43:49])
    
    wire n3747, spi_csn_buf1_p, spi_csn_buf0_p, spi_csn_buf2_p, spi_cmd_start_reg, 
        n8196, spi_idle, n4932, n4197, n4198, n7896, n4495;
    wire [1:0]n1477;
    
    wire n4082;
    wire [0:0]n1378;
    
    wire n954, n3749, n3751, n8286, n8279;
    wire [15:0]n399;
    
    wire n8265, n7395, n7751, n8266, n8261, n8304, n8303, n8307, 
        n8306;
    wire [7:0]n38;
    
    wire n7292, n263, n4480, n7905;
    wire [0:0]n1179;
    
    wire n7535, n4821;
    wire [7:0]n48;
    
    wire n8141, n8255, n8269, n3809, n8238, n4496, n4106, n8289, 
        n8251, n4081, n7900, n7913, n808, n8258;
    wire [7:0]n1405;
    
    wire n8257, n7773, n4176, n8268, n8108, n8272, n4, n7354, 
        n8275, n7763, n7741, n7809, n3817, n7, n4903, n8302, 
        n8244, n8246;
    wire [1:0]n1474;
    wire [1:0]n1471;
    
    wire n8479, n7755;
    wire [1:0]n1464;
    
    wire n1359, n4210, n4211, n7920;
    wire [7:0]n168;
    
    wire n7918, n462, n7748, n4172, n329, n6252, n8239, n6, 
        n4660, n8240, n7357, n8241, n8278, n8274, n4908, n7800, 
        n12, n8277, n8259, n8271, n7324, n8171, n4168, n5, n4624, 
        n7768, n779, n7838, n7785, n7769, n780, n7293, n7294, 
        n8308, n7533, n4162, n4160, n4156, n8243, n7796, n4_adj_1, 
        n8245, n8301, n8096;
    wire [7:0]n177;
    
    wire n777, n8170, n7792, n8300, n8273, n7465, n7788, n8169, 
        n1138;
    wire [1:0]n1458;
    
    wire n8252, n6224, n4071, n7791, n7790, n7789, n4896, n4690, 
        n7732, n6201, n4679, n298, n8186, n31, n8292, n8290, 
        n4872, n8195, n67, n7737, n55_adj_2, n8194, n7761, n7736, 
        n7778, n58, n3822, n8263, n8281, n7_adj_3, n8297, n6239, 
        n7776, n8249, n7_adj_4, n6_adj_5, n55_adj_6, n7739, n7753, 
        n7734, n46_adj_7, n52_adj_8, n7775, n8293, n7861, n7758, 
        n24, n44, n8095, n8097, n8247, n4747, n4708, n7801, 
        n7744, n8291, n4_adj_9, n8295, n7295, n21, n8296, n4_adj_11, 
        n49_adj_12, n4_adj_13, n8250, n7869, n8305;
    
    FD1P3BX spi_cmd_i0_i0 (.D(n7733), .SP(n444), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(spi_cmd[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam spi_cmd_i0_i0.GSR = "DISABLED";
    FD1P3DX irq_en_i0_i0 (.D(wb_dat_o[0]), .SP(n3747), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(irq_en[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam irq_en_i0_i0.GSR = "DISABLED";
    FD1S3BX spi_csn_buf1_p_247 (.D(spi_csn_buf0_p), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(spi_csn_buf1_p)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(168[11:44])
    defparam spi_csn_buf1_p_247.GSR = "DISABLED";
    FD1S3BX spi_csn_buf2_p_248 (.D(spi_csn_buf1_p), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(spi_csn_buf2_p)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(175[11:44])
    defparam spi_csn_buf2_p_248.GSR = "DISABLED";
    FD1S3DX spi_cmd_start_reg_249 (.D(n8196), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(spi_cmd_start_reg)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(182[11] 185[40])
    defparam spi_cmd_start_reg_249.GSR = "DISABLED";
    FD1S3DX spi_idle_250 (.D(n4932), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(spi_idle)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(195[11] 198[31])
    defparam spi_idle_250.GSR = "DISABLED";
    PFUMX i2745 (.BLUT(n4197), .ALUT(n4198), .C0(n7896), .Z(n4495));
    FD1S3BX address_i1 (.D(n1477[0]), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(\address[0] )) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam address_i1.GSR = "DISABLED";
    FD1S3DX rd_en_253 (.D(n4082), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(rd_en)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam rd_en_253.GSR = "DISABLED";
    FD1S3DX wr_en_254 (.D(n1378[0]), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_en)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_en_254.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i0 (.D(wb_dat_o[0]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i0.GSR = "DISABLED";
    FD1P3DX gpio_dout__i1 (.D(wb_dat_o[0]), .SP(n3749), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(\gpio_dout[0] )) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_dout__i1.GSR = "DISABLED";
    FD1P3DX mem_wdata_i0_i0 (.D(wb_dat_o[0]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i0.GSR = "DISABLED";
    IFS1P3BX spi_csn_buf0_p_246 (.D(SPI_CSN_c), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .PD(POWERUP_RST), .Q(spi_csn_buf0_p)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(161[11:37])
    defparam spi_csn_buf0_p_246.GSR = "DISABLED";
    LUT4 i2_3_lut_4_lut (.A(n8286), .B(spi_cmd[3]), .C(n8279), .D(spi_cmd[0]), 
         .Z(n3749)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;
    defparam i2_3_lut_4_lut.init = 16'h0020;
    LUT4 i226_2_lut_rep_102 (.A(wb_ack_o), .B(n399[1]), .Z(n8265)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i226_2_lut_rep_102.init = 16'h8888;
    LUT4 i1_4_lut_4_lut (.A(wb_ack_o), .B(n399[1]), .C(n7395), .D(n399[2]), 
         .Z(n7751)) /* synthesis lut_function=(A (B+(C))+!A (C+(D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_4_lut.init = 16'hfdf8;
    LUT4 i1_2_lut_rep_103 (.A(n399[3]), .B(n399[7]), .Z(n8266)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_103.init = 16'heeee;
    LUT4 i6203_then_4_lut (.A(n8261), .B(wb_dat_o[4]), .C(n8266), .D(wb_dat_o[3]), 
         .Z(n8304)) /* synthesis lut_function=(A ((D)+!C)+!A (((D)+!C)+!B)) */ ;
    defparam i6203_then_4_lut.init = 16'hff1f;
    LUT4 i6203_else_4_lut (.A(n399[8]), .B(n399[10]), .Z(n8303)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i6203_else_4_lut.init = 16'h1111;
    LUT4 i2419_4_lut_then_2_lut (.A(n399[6]), .B(wb_ack_o), .Z(n8307)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2419_4_lut_then_2_lut.init = 16'h8888;
    LUT4 i2419_4_lut_else_2_lut (.A(n399[6]), .B(wb_ack_o), .C(wb_dat_o[4]), 
         .D(n399[7]), .Z(n8306)) /* synthesis lut_function=(A (B+(D))+!A !(B (C+!(D))+!B !(D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2419_4_lut_else_2_lut.init = 16'hbf88;
    CCU2D mem_addr_2062_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(MEM_ADDR[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n7292), .S1(n38[0]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_add_4_1.INIT0 = 16'hF000;
    defparam mem_addr_2062_add_4_1.INIT1 = 16'h0555;
    defparam mem_addr_2062_add_4_1.INJECT1_0 = "NO";
    defparam mem_addr_2062_add_4_1.INJECT1_1 = "NO";
    LUT4 i6120_4_lut (.A(n263), .B(n4480), .C(n399[10]), .D(n7905), 
         .Z(n1179[0])) /* synthesis lut_function=(A (B+!(C+!(D)))+!A (B (C+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6120_4_lut.init = 16'hcacc;
    FD1S3BX main_sm_FSM_i1 (.D(n7535), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(n399[0]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i1.GSR = "DISABLED";
    FD1P3DX mem_addr_2062__i7 (.D(n48[7]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[7]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i7.GSR = "DISABLED";
    LUT4 n8141_bdd_4_lut (.A(n8141), .B(n8255), .C(n8269), .D(n3809), 
         .Z(n8238)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (B (C (D)))) */ ;
    defparam n8141_bdd_4_lut.init = 16'hca00;
    LUT4 i2730_4_lut (.A(n4496), .B(n8261), .C(n399[10]), .D(n4106), 
         .Z(n4480)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2730_4_lut.init = 16'h3a0a;
    LUT4 i6078_2_lut (.A(n399[9]), .B(n399[8]), .Z(n7905)) /* synthesis lut_function=(!(A+(B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6078_2_lut.init = 16'h1111;
    LUT4 i2339_4_lut (.A(n4495), .B(n8289), .C(n399[11]), .D(n8251), 
         .Z(n4081)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2339_4_lut.init = 16'h3a0a;
    LUT4 i6159_4_lut (.A(n399[11]), .B(n399[10]), .C(n399[9]), .D(n7900), 
         .Z(n7913)) /* synthesis lut_function=(A+!(B+(C+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6159_4_lut.init = 16'habaa;
    LUT4 i6073_2_lut (.A(n399[8]), .B(n399[7]), .Z(n7900)) /* synthesis lut_function=(!(A+(B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6073_2_lut.init = 16'h1111;
    FD1P3DX mem_addr_2062__i6 (.D(n48[6]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[6]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i6.GSR = "DISABLED";
    LUT4 mem_addr_2062_mux_6_i1_4_lut (.A(wb_dat_o[0]), .B(n38[0]), .C(n808), 
         .D(n8258), .Z(n48[0])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i1_4_lut.init = 16'hcac0;
    LUT4 i4352_4_lut (.A(gpio_din[2]), .B(n8255), .C(TXData[2]), .D(spi_cmd[1]), 
         .Z(n1405[2])) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(502[30] 519[37])
    defparam i4352_4_lut.init = 16'hc088;
    LUT4 i2429_4_lut (.A(n399[12]), .B(n8257), .C(wb_ack_o), .D(n7773), 
         .Z(n4176)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2429_4_lut.init = 16'h3b0a;
    FD1P3DX mem_addr_2062__i5 (.D(n48[5]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[5]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i5.GSR = "DISABLED";
    LUT4 i2623_2_lut_rep_105 (.A(spi_cmd[2]), .B(spi_cmd[3]), .Z(n8268)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i2623_2_lut_rep_105.init = 16'hbbbb;
    FD1P3DX en_port_257 (.D(n8272), .SP(n8108), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(GP_Enable));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam en_port_257.GSR = "DISABLED";
    LUT4 i2_3_lut (.A(wb_ack_o), .B(n4), .C(n399[12]), .Z(n7354)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2_3_lut.init = 16'hecec;
    LUT4 i1_4_lut (.A(n8275), .B(n399[11]), .C(n7763), .D(n7741), .Z(n4)) /* synthesis lut_function=(A (B (D))+!A (B (C+(D))+!B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut.init = 16'hdc50;
    FD1P3DX gpi_ld_258 (.D(wb_dat_o[0]), .SP(n7809), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(gpi_ld));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpi_ld_258.GSR = "DISABLED";
    FD1S3DX mem_rd_first_268 (.D(n3817), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(MEM_RD_FIRST));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_rd_first_268.GSR = "DISABLED";
    LUT4 i1_2_lut_3_lut_4_lut (.A(n8286), .B(spi_cmd[3]), .C(n7), .D(spi_cmd[0]), 
         .Z(n3747)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h2000;
    FD1P3DX wr_data_i0_i1 (.D(n8302), .SP(n4903), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i1.GSR = "DISABLED";
    FD1P3DX mem_addr_2062__i4 (.D(n48[4]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[4]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i4.GSR = "DISABLED";
    FD1P3DX mem_addr_2062__i3 (.D(n48[3]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[3]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i3.GSR = "DISABLED";
    LUT4 i1_4_lut_adj_6 (.A(wb_ack_o), .B(n8255), .C(n8244), .D(n8246), 
         .Z(n7741)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C)))) */ ;
    defparam i1_4_lut_adj_6.init = 16'h7f5f;
    LUT4 i4351_4_lut (.A(gpio_din[3]), .B(n8255), .C(TXData[3]), .D(spi_cmd[1]), 
         .Z(n1405[3])) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(502[30] 519[37])
    defparam i4351_4_lut.init = 16'hc088;
    L6MUX21 mux_896_i2 (.D0(n1474[1]), .D1(n1471[1]), .SD(n8479), .Z(n1477[1]));
    PFUMX mux_895_i2 (.BLUT(n7755), .ALUT(n1464[1]), .C0(n1359), .Z(n1474[1]));
    FD1P3DX mem_addr_2062__i2 (.D(n48[2]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[2]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i2.GSR = "DISABLED";
    FD1P3DX mem_addr_2062__i1 (.D(n48[1]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[1]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i1.GSR = "DISABLED";
    PFUMX mux_864_i1 (.BLUT(n4210), .ALUT(n4211), .C0(n7920), .Z(n1378[0]));
    PFUMX mux_896_i1 (.BLUT(n168[0]), .ALUT(n1471[0]), .C0(n7918), .Z(n1477[0]));
    LUT4 i2425_4_lut (.A(n399[10]), .B(n462), .C(wb_ack_o), .D(n7748), 
         .Z(n4172)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2425_4_lut.init = 16'heece;
    PFUMX i2746 (.BLUT(n329), .ALUT(n6252), .C0(n399[9]), .Z(n4496));
    LUT4 i1_2_lut_rep_76_3_lut_4_lut (.A(n8261), .B(wb_dat_o[3]), .C(n399[3]), 
         .D(wb_ack_o), .Z(n8239)) /* synthesis lut_function=(!(A ((D)+!C)+!A (B ((D)+!C)+!B !(C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(391[36] 400[30])
    defparam i1_2_lut_rep_76_3_lut_4_lut.init = 16'h10f0;
    LUT4 i1_4_lut_adj_7 (.A(spi_cmd[3]), .B(spi_cmd[1]), .C(spi_cmd[0]), 
         .D(spi_cmd[2]), .Z(n7748)) /* synthesis lut_function=(A ((C+(D))+!B)+!A !(B (C+!(D))+!B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(459[27] 497[34])
    defparam i1_4_lut_adj_7.init = 16'hafb3;
    LUT4 i3_4_lut (.A(n399[9]), .B(n6), .C(n4660), .D(n8240), .Z(n7357)) /* synthesis lut_function=(A (B+(C+!(D)))+!A (B+(C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i3_4_lut.init = 16'hfcfe;
    LUT4 i6164_4_lut_4_lut (.A(n8241), .B(n8278), .C(n8269), .D(n8274), 
         .Z(n4908)) /* synthesis lut_function=(!(A+!(B (C+(D))+!B (C)))) */ ;
    defparam i6164_4_lut_4_lut.init = 16'h5450;
    LUT4 i2_4_lut (.A(n7800), .B(n12), .C(n8261), .D(n399[5]), .Z(n6)) /* synthesis lut_function=(A+!((C+!(D))+!B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2_4_lut.init = 16'haeaa;
    LUT4 i1_4_lut_adj_8 (.A(n8274), .B(n8277), .C(n8259), .D(n8271), 
         .Z(n4660)) /* synthesis lut_function=(!(A ((C)+!B)+!A ((C (D))+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_adj_8.init = 16'h0c4c;
    PFUMX i2340 (.BLUT(n1179[0]), .ALUT(n4081), .C0(n7913), .Z(n4082));
    LUT4 i2421_4_lut (.A(n399[8]), .B(n7324), .C(wb_ack_o), .D(n8171), 
         .Z(n4168)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2421_4_lut.init = 16'heece;
    LUT4 i3136_3_lut (.A(n399[0]), .B(spi_csn_buf1_p), .C(spi_idle), .Z(n4932)) /* synthesis lut_function=(A (B)+!A (B+(C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(195[11] 198[31])
    defparam i3136_3_lut.init = 16'hdcdc;
    LUT4 i2449_3_lut (.A(n5), .B(wb_ack_o), .C(n4624), .Z(n4197)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2449_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_rep_137 (.A(n399[8]), .B(n399[10]), .C(wb_ack_o), .D(n399[5]), 
         .Z(n8479)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (D))) */ ;
    defparam i1_3_lut_rep_137.init = 16'hffe0;
    FD1P3DX mem_addr_2062__i0 (.D(n48[0]), .SP(n4821), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_ADDR[0]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062__i0.GSR = "DISABLED";
    PFUMX mux_429_i3 (.BLUT(n7768), .ALUT(n1405[2]), .C0(n8269), .Z(n779));
    LUT4 i6117_4_lut (.A(n7838), .B(n12), .C(n399[5]), .D(n7785), .Z(n4198)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6117_4_lut.init = 16'hca0a;
    FD1S3DX main_sm_FSM_i13 (.D(n4176), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[12]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i13.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i12 (.D(n7354), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[11]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i12.GSR = "DISABLED";
    PFUMX mux_429_i4 (.BLUT(n7769), .ALUT(n1405[3]), .C0(n8269), .Z(n780));
    FD1S3DX main_sm_FSM_i11 (.D(n4172), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[10]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i11.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i10 (.D(n7357), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[9]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i10.GSR = "DISABLED";
    CCU2D mem_addr_2062_add_4_5 (.A0(MEM_ADDR[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(MEM_ADDR[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n7293), .COUT(n7294), .S0(n38[3]), .S1(n38[4]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_add_4_5.INIT0 = 16'hfaaa;
    defparam mem_addr_2062_add_4_5.INIT1 = 16'hfaaa;
    defparam mem_addr_2062_add_4_5.INJECT1_0 = "NO";
    defparam mem_addr_2062_add_4_5.INJECT1_1 = "NO";
    FD1S3DX main_sm_FSM_i9 (.D(n4168), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[8]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i9.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i8 (.D(n8308), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[7]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i8.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i7 (.D(n7533), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[6]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i7.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i6 (.D(n444), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[5]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i6.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i5 (.D(n4162), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[4]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i5.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i4 (.D(n4160), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[3]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i4.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i3 (.D(n7751), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[2]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i3.GSR = "DISABLED";
    FD1S3DX main_sm_FSM_i2 (.D(n4156), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n399[1]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam main_sm_FSM_i2.GSR = "DISABLED";
    LUT4 i6143_2_lut_2_lut_3_lut_4_lut_4_lut_4_lut (.A(n399[8]), .B(n399[10]), 
         .C(wb_ack_o), .D(n399[5]), .Z(n7918)) /* synthesis lut_function=(A (C+!(D))+!A (B (C+!(D))+!B !(D))) */ ;
    defparam i6143_2_lut_2_lut_3_lut_4_lut_4_lut_4_lut.init = 16'he0ff;
    LUT4 i6167_2_lut (.A(n399[5]), .B(n399[3]), .Z(n7896)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6167_2_lut.init = 16'heeee;
    LUT4 i1_4_lut_adj_9 (.A(n8243), .B(wb_ack_o), .C(n7796), .D(n399[6]), 
         .Z(n4_adj_1)) /* synthesis lut_function=(!(A (B+!(C+(D)))+!A !(B (C)+!B (C+(D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_adj_9.init = 16'h7370;
    LUT4 i6162_3_lut_3_lut_4_lut_4_lut (.A(n8255), .B(n8269), .C(n8245), 
         .D(n3809), .Z(n4903)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A !(B+(C+!(D)))) */ ;
    defparam i6162_3_lut_3_lut_4_lut_4_lut.init = 16'h8b00;
    LUT4 i2_3_lut_adj_10 (.A(n399[6]), .B(n399[12]), .C(n399[2]), .Z(n4624)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2_3_lut_adj_10.init = 16'hfefe;
    LUT4 mux_429_i2_then_4_lut (.A(n8255), .B(gpio_din[1]), .C(spi_cmd[1]), 
         .D(TXData[1]), .Z(n8301)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))) */ ;
    defparam mux_429_i2_then_4_lut.init = 16'ha808;
    LUT4 n406_bdd_4_lut_6256 (.A(n399[11]), .B(wb_dat_o[4]), .C(wb_ack_o), 
         .D(n8261), .Z(n8096)) /* synthesis lut_function=(!((B (C)+!B (C (D)))+!A)) */ ;
    defparam n406_bdd_4_lut_6256.init = 16'h0a2a;
    LUT4 i6166_3_lut_3_lut_4_lut (.A(spi_cmd[0]), .B(spi_cmd[1]), .C(n8286), 
         .D(n8271), .Z(n7809)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;
    defparam i6166_3_lut_3_lut_4_lut.init = 16'h0080;
    FD1P3DX mem_wdata_i0_i7 (.D(wb_dat_o[7]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[7])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i7.GSR = "DISABLED";
    PFUMX mux_429_i1 (.BLUT(n177[0]), .ALUT(n1405[0]), .C0(n8269), .Z(n777));
    LUT4 i1_2_lut_rep_108 (.A(spi_cmd[3]), .B(spi_cmd[2]), .Z(n8271)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(434[27:34])
    defparam i1_2_lut_rep_108.init = 16'heeee;
    LUT4 spi_cmd_0__bdd_3_lut_6313 (.A(spi_cmd[0]), .B(spi_cmd[2]), .C(spi_cmd[1]), 
         .Z(n8170)) /* synthesis lut_function=(A ((C)+!B)+!A !(B+(C))) */ ;
    defparam spi_cmd_0__bdd_3_lut_6313.init = 16'ha3a3;
    FD1P3DX mem_wdata_i0_i6 (.D(wb_dat_o[6]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[6])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i6.GSR = "DISABLED";
    FD1P3DX mem_wdata_i0_i5 (.D(wb_dat_o[5]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[5])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i5.GSR = "DISABLED";
    FD1P3DX mem_wdata_i0_i4 (.D(wb_dat_o[4]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[4])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i4.GSR = "DISABLED";
    FD1P3DX mem_wdata_i0_i3 (.D(wb_dat_o[3]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i3.GSR = "DISABLED";
    FD1P3DX mem_wdata_i0_i2 (.D(wb_dat_o[2]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i2.GSR = "DISABLED";
    FD1P3DX mem_wdata_i0_i1 (.D(wb_dat_o[1]), .SP(n3751), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(RXData[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wdata_i0_i1.GSR = "DISABLED";
    FD1P3DX gpio_dout__i2 (.D(wb_dat_o[1]), .SP(n3749), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(\gpio_dout[1] )) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_dout__i2.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i7 (.D(wb_dat_o[7]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[7])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i7.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i6 (.D(wb_dat_o[6]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[6])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i6.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i5 (.D(wb_dat_o[5]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[5])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i5.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i4 (.D(wb_dat_o[4]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[4])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i4.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i3 (.D(wb_dat_o[3]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i3.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i2 (.D(wb_dat_o[2]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i2.GSR = "DISABLED";
    FD1P3DX gpio_addr_i0_i1 (.D(wb_dat_o[1]), .SP(n954), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpio_addr[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam gpio_addr_i0_i1.GSR = "DISABLED";
    FD1S3DX address_i2 (.D(n1477[1]), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(\address[1] )) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam address_i2.GSR = "DISABLED";
    LUT4 i890_1_lut_rep_109 (.A(spi_cmd[0]), .Z(n8272)) /* synthesis lut_function=(!(A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i890_1_lut_rep_109.init = 16'h5555;
    FD1P3DX wr_data_i0_i7 (.D(n7792), .SP(n4908), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[7])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i7.GSR = "DISABLED";
    LUT4 mux_429_i2_else_4_lut (.A(spi_cmd[0]), .B(n8268), .C(irq_en[1]), 
         .D(spi_cmd[1]), .Z(n8300)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;
    defparam mux_429_i2_else_4_lut.init = 16'h0010;
    LUT4 i2_3_lut_4_lut_4_lut (.A(spi_cmd[0]), .B(n8289), .C(n8261), .D(n8273), 
         .Z(n7465)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i2_3_lut_4_lut_4_lut.init = 16'h0400;
    LUT4 i2049_2_lut_rep_78_3_lut_4_lut_4_lut (.A(spi_cmd[0]), .B(n8269), 
         .C(n3809), .D(n8273), .Z(n8241)) /* synthesis lut_function=(A (B+!(C))+!A !(B (C (D))+!B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i2049_2_lut_rep_78_3_lut_4_lut_4_lut.init = 16'h8fcf;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(spi_cmd[0]), .B(n8273), .C(n8289), 
         .D(n399[11]), .Z(n7788)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'h4000;
    LUT4 spi_cmd_0__bdd_3_lut_6240_3_lut (.A(spi_cmd[0]), .B(spi_cmd[1]), 
         .C(spi_cmd[2]), .Z(n8169)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam spi_cmd_0__bdd_3_lut_6240_3_lut.init = 16'hf4f4;
    LUT4 i685_2_lut (.A(spi_cmd[2]), .B(spi_cmd[1]), .Z(n1138)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam i685_2_lut.init = 16'heeee;
    PFUMX mux_894_i2 (.BLUT(n168[1]), .ALUT(n1458[1]), .C0(n8252), .Z(n1471[1]));
    LUT4 i4448_4_lut_4_lut (.A(spi_cmd[0]), .B(spi_cmd[1]), .C(n8268), 
         .D(irq_en[0]), .Z(n177[0])) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)+!B (C+!(D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i4448_4_lut_4_lut.init = 16'h0d0c;
    LUT4 i4469_4_lut (.A(n6224), .B(n4071), .C(wr_en), .D(n399[12]), 
         .Z(n4821)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))) */ ;
    defparam i4469_4_lut.init = 16'ha088;
    LUT4 spi_xfer_done_bdd_4_lut_6271 (.A(n8261), .B(spi_cmd[1]), .C(spi_cmd[3]), 
         .D(spi_cmd[2]), .Z(n7785)) /* synthesis lut_function=(!(A+(B (C (D))+!B (C (D)+!C !(D))))) */ ;
    defparam spi_xfer_done_bdd_4_lut_6271.init = 16'h0554;
    LUT4 i237_2_lut (.A(wb_ack_o), .B(n399[4]), .Z(n444)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i237_2_lut.init = 16'h8888;
    LUT4 i2_2_lut (.A(spi_cmd[1]), .B(spi_cmd[2]), .Z(n7)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut.init = 16'h8888;
    FD1P3DX wr_data_i0_i6 (.D(n7791), .SP(n4908), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[6])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i6.GSR = "DISABLED";
    FD1P3DX wr_data_i0_i5 (.D(n7790), .SP(n4908), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[5])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i5.GSR = "DISABLED";
    FD1P3DX wr_data_i0_i4 (.D(n7789), .SP(n4908), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[4])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i4.GSR = "DISABLED";
    FD1P3DX wr_data_i0_i3 (.D(n780), .SP(n4896), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i3.GSR = "DISABLED";
    FD1P3DX wr_data_i0_i2 (.D(n779), .SP(n4896), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i2.GSR = "DISABLED";
    LUT4 i3097_2_lut_rep_82_3_lut_4_lut_4_lut (.A(spi_cmd[0]), .B(spi_cmd[1]), 
         .C(spi_cmd[3]), .D(spi_cmd[2]), .Z(n8245)) /* synthesis lut_function=(A ((D)+!C)+!A (B+((D)+!C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i3097_2_lut_rep_82_3_lut_4_lut_4_lut.init = 16'hff4f;
    LUT4 i1_4_lut_adj_11 (.A(n4690), .B(n7732), .C(n6201), .D(n4679), 
         .Z(n7733)) /* synthesis lut_function=((B+!(C (D)))+!A) */ ;
    defparam i1_4_lut_adj_11.init = 16'hdfff;
    LUT4 i4358_4_lut (.A(gpio_din[0]), .B(n8255), .C(TXData[0]), .D(spi_cmd[1]), 
         .Z(n1405[0])) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(502[30] 519[37])
    defparam i4358_4_lut.init = 16'hc088;
    LUT4 i1_4_lut_4_lut_adj_12 (.A(spi_cmd[0]), .B(spi_cmd[1]), .C(spi_cmd[2]), 
         .D(spi_cmd[3]), .Z(n298)) /* synthesis lut_function=(!(A (B+((D)+!C))+!A (B (D)+!B ((D)+!C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i1_4_lut_4_lut_adj_12.init = 16'h0074;
    LUT4 i1_4_lut_adj_13 (.A(gpio_din[7]), .B(n7788), .C(TXData[7]), .D(spi_cmd[1]), 
         .Z(n7792)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;
    defparam i1_4_lut_adj_13.init = 16'hc088;
    LUT4 spi_cmd_0__bdd_4_lut_6314 (.A(spi_cmd[0]), .B(spi_cmd[1]), .C(spi_cmd[2]), 
         .D(spi_cmd[3]), .Z(n8186)) /* synthesis lut_function=(!(A (B (C+!(D))+!B (C (D)+!C !(D)))+!A (B (D)+!B (C (D)+!C !(D))))) */ ;
    defparam spi_cmd_0__bdd_4_lut_6314.init = 16'h0b74;
    LUT4 i2_4_lut_adj_14 (.A(n31), .B(n8292), .C(n4698), .D(n8290), 
         .Z(n7732)) /* synthesis lut_function=(A+(B (C+!(D))+!B (C))) */ ;
    defparam i2_4_lut_adj_14.init = 16'hfafe;
    LUT4 i1_2_lut_rep_110 (.A(spi_cmd[2]), .B(spi_cmd[3]), .Z(n8273)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut_rep_110.init = 16'h2222;
    LUT4 i1_2_lut_rep_92_2_lut_3_lut (.A(spi_cmd[2]), .B(spi_cmd[3]), .C(spi_cmd[0]), 
         .Z(n8255)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;
    defparam i1_2_lut_rep_92_2_lut_3_lut.init = 16'h0202;
    LUT4 i1_3_lut_rep_95_4_lut (.A(spi_cmd[2]), .B(spi_cmd[3]), .C(spi_cmd[1]), 
         .D(spi_cmd[0]), .Z(n8258)) /* synthesis lut_function=(!((B+(C (D)+!C !(D)))+!A)) */ ;
    defparam i1_3_lut_rep_95_4_lut.init = 16'h0220;
    LUT4 i2331_2_lut_rep_111 (.A(spi_cmd[0]), .B(spi_cmd[1]), .Z(n8274)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i2331_2_lut_rep_111.init = 16'hbbbb;
    LUT4 spi_cmd_2__bdd_3_lut_6232_4_lut (.A(spi_cmd[0]), .B(spi_cmd[1]), 
         .C(spi_cmd[3]), .D(spi_cmd[2]), .Z(n8141)) /* synthesis lut_function=(!(A ((D)+!C)+!A (B+((D)+!C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam spi_cmd_2__bdd_3_lut_6232_4_lut.init = 16'h00b0;
    LUT4 i4446_2_lut_3_lut_4_lut (.A(spi_cmd[0]), .B(spi_cmd[1]), .C(n8277), 
         .D(n8275), .Z(n3817)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam i4446_2_lut_3_lut_4_lut.init = 16'h0040;
    LUT4 equal_107_i6_2_lut_rep_112 (.A(spi_cmd[2]), .B(spi_cmd[3]), .Z(n8275)) /* synthesis lut_function=((B)+!A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(419[27:34])
    defparam equal_107_i6_2_lut_rep_112.init = 16'hdddd;
    LUT4 i1_4_lut_adj_15 (.A(gpio_din[6]), .B(n7788), .C(TXData[6]), .D(spi_cmd[1]), 
         .Z(n7791)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;
    defparam i1_4_lut_adj_15.init = 16'hc088;
    LUT4 i1_3_lut_rep_96_4_lut (.A(spi_cmd[2]), .B(spi_cmd[3]), .C(spi_cmd[0]), 
         .D(spi_cmd[1]), .Z(n8259)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(419[27:34])
    defparam i1_3_lut_rep_96_4_lut.init = 16'hffdf;
    LUT4 i1_4_lut_adj_16 (.A(gpio_din[5]), .B(n7788), .C(TXData[5]), .D(spi_cmd[1]), 
         .Z(n7790)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;
    defparam i1_4_lut_adj_16.init = 16'hc088;
    LUT4 equal_108_i7_2_lut_rep_94_3_lut_4_lut (.A(spi_cmd[2]), .B(spi_cmd[3]), 
         .C(spi_cmd[1]), .D(spi_cmd[0]), .Z(n8257)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(419[27:34])
    defparam equal_108_i7_2_lut_rep_94_3_lut_4_lut.init = 16'hffdf;
    LUT4 i1_4_lut_adj_17 (.A(gpio_din[4]), .B(n7788), .C(TXData[4]), .D(spi_cmd[1]), 
         .Z(n7789)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;
    defparam i1_4_lut_adj_17.init = 16'hc088;
    FD1P3DX mem_wr_active_270 (.D(n399[8]), .SP(n4872), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(MEM_WR_ACTIVE));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wr_active_270.GSR = "DISABLED";
    LUT4 n414_bdd_4_lut (.A(spi_cmd_start_reg), .B(n399[0]), .C(spi_csn_buf2_p), 
         .D(spi_csn_buf1_p), .Z(n8195)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+!(D)))+!A ((D)+!C))) */ ;
    defparam n414_bdd_4_lut.init = 16'h20f2;
    LUT4 n410_bdd_4_lut_6244 (.A(n399[5]), .B(spi_cmd[1]), .C(spi_cmd[3]), 
         .D(spi_cmd[2]), .Z(n8108)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;
    defparam n410_bdd_4_lut_6244.init = 16'h0002;
    PFUMX i85 (.BLUT(n67), .ALUT(n7737), .C0(wb_dat_o[2]), .Z(n55_adj_2));
    LUT4 n414_bdd_2_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), .Z(n8194)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam n414_bdd_2_lut.init = 16'h2222;
    LUT4 i1_4_lut_adj_18 (.A(n3809), .B(n7761), .C(n8255), .D(n8269), 
         .Z(n4896)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_18.init = 16'ha088;
    LUT4 i436_2_lut_rep_114 (.A(wb_ack_o), .B(n399[8]), .Z(n8277)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i436_2_lut_rep_114.init = 16'h8888;
    LUT4 i1_2_lut_3_lut (.A(wb_ack_o), .B(n399[8]), .C(spi_cmd[0]), .Z(n7763)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_2_lut_3_lut.init = 16'h0808;
    LUT4 i2329_3_lut_4_lut (.A(wb_ack_o), .B(n399[8]), .C(n399[9]), .D(MEM_WR), 
         .Z(n4071)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2329_3_lut_4_lut.init = 16'hf808;
    LUT4 i6016_3_lut_4_lut_4_lut (.A(wb_ack_o), .B(n8261), .C(wb_dat_o[3]), 
         .D(wb_dat_o[4]), .Z(n7838)) /* synthesis lut_function=(A (B (C)+!B (C+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(525[40:69])
    defparam i6016_3_lut_4_lut_4_lut.init = 16'ha0a2;
    LUT4 i1_2_lut_rep_115 (.A(spi_cmd[3]), .B(spi_cmd[2]), .Z(n8278)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut_rep_115.init = 16'h2222;
    PFUMX i83 (.BLUT(n7736), .ALUT(n7778), .C0(wb_dat_o[7]), .Z(n58));
    LUT4 i1_2_lut_3_lut_3_lut_4_lut (.A(spi_cmd[3]), .B(spi_cmd[2]), .C(spi_cmd[1]), 
         .D(spi_cmd[0]), .Z(n7761)) /* synthesis lut_function=(!((B+!((D)+!C))+!A)) */ ;
    defparam i1_2_lut_3_lut_3_lut_4_lut.init = 16'h2202;
    LUT4 i2_3_lut_4_lut_adj_19 (.A(n8186), .B(n8261), .C(n4_adj_1), .D(n399[5]), 
         .Z(n7533)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A (C)) */ ;
    defparam i2_3_lut_4_lut_adj_19.init = 16'hf2f0;
    LUT4 i82_4_lut (.A(wb_dat_o[5]), .B(wb_dat_o[3]), .C(wb_dat_o[6]), 
         .D(wb_dat_o[0]), .Z(n67)) /* synthesis lut_function=(!(A (((D)+!C)+!B)+!A (C+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(280[27] 294[34])
    defparam i82_4_lut.init = 16'h0580;
    LUT4 i2_2_lut_rep_116 (.A(spi_cmd[2]), .B(spi_cmd[1]), .Z(n8279)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i2_2_lut_rep_116.init = 16'h4444;
    FD1S3DX mem_wr_264 (.D(n3822), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(MEM_WR));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam mem_wr_264.GSR = "DISABLED";
    LUT4 i2_4_lut_adj_20 (.A(n7763), .B(spi_cmd[3]), .C(spi_cmd[1]), .D(spi_cmd[2]), 
         .Z(n954)) /* synthesis lut_function=(!((B+(C (D)+!C !(D)))+!A)) */ ;
    defparam i2_4_lut_adj_20.init = 16'h0220;
    LUT4 mux_79_Mux_0_i15_4_lut_4_lut_4_lut (.A(spi_cmd[2]), .B(spi_cmd[1]), 
         .C(spi_cmd[3]), .D(spi_cmd[0]), .Z(n168[0])) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D)+!C !(D))+!B)) */ ;
    defparam mux_79_Mux_0_i15_4_lut_4_lut_4_lut.init = 16'hf3bf;
    LUT4 i19_4_lut_4_lut (.A(spi_cmd[2]), .B(spi_cmd[1]), .C(spi_cmd[3]), 
         .D(spi_cmd[0]), .Z(n12)) /* synthesis lut_function=(!(A ((C+!(D))+!B)+!A ((C (D)+!C !(D))+!B))) */ ;
    defparam i19_4_lut_4_lut.init = 16'h0c40;
    LUT4 i1_3_lut_4_lut (.A(n8263), .B(n8262), .C(n399[4]), .D(n399[1]), 
         .Z(n5)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(241[28:56])
    defparam i1_3_lut_4_lut.init = 16'h0008;
    LUT4 mux_79_Mux_1_i15_4_lut_4_lut_4_lut (.A(spi_cmd[0]), .B(spi_cmd[2]), 
         .C(spi_cmd[1]), .D(spi_cmd[3]), .Z(n168[1])) /* synthesis lut_function=(!(A ((D)+!C)+!A (B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(298[27] 361[34])
    defparam mux_79_Mux_1_i15_4_lut_4_lut_4_lut.init = 16'h10a0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_21 (.A(wb_ack_o), .B(n8261), .C(n8259), 
         .D(n399[10]), .Z(n7800)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(405[27] 435[34])
    defparam i1_2_lut_3_lut_4_lut_adj_21.init = 16'h0200;
    LUT4 i28_2_lut_rep_100_3_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), 
         .C(spi_cmd_start_reg), .Z(n8263)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(188[28:62])
    defparam i28_2_lut_rep_100_3_lut.init = 16'hf2f2;
    LUT4 i36_2_lut_rep_118 (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), .Z(n8281)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:62])
    defparam i36_2_lut_rep_118.init = 16'h4444;
    LUT4 i37_2_lut_rep_98_3_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), 
         .C(spi_idle), .Z(n8261)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:62])
    defparam i37_2_lut_rep_98_3_lut.init = 16'hf4f4;
    LUT4 i2_2_lut_adj_22 (.A(spi_cmd[1]), .B(spi_cmd[2]), .Z(n7_adj_3)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i2_2_lut_adj_22.init = 16'h4444;
    LUT4 i196_2_lut_rep_83_3_lut_4_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), 
         .C(n8289), .D(spi_idle), .Z(n8246)) /* synthesis lut_function=(!(A ((D)+!C)+!A (B+((D)+!C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:62])
    defparam i196_2_lut_rep_83_3_lut_4_lut.init = 16'h00b0;
    LUT4 i1_3_lut (.A(wb_dat_o[4]), .B(n8297), .C(wb_dat_o[1]), .Z(n7736)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(280[27] 294[34])
    defparam i1_3_lut.init = 16'h0404;
    LUT4 i3_4_lut_adj_23 (.A(wb_dat_o[4]), .B(wb_dat_o[1]), .C(n6239), 
         .D(n7776), .Z(n7778)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(280[27] 294[34])
    defparam i3_4_lut_adj_23.init = 16'h0800;
    LUT4 i189_2_lut_rep_86_3_lut_4_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), 
         .C(wb_ack_o), .D(spi_idle), .Z(n8249)) /* synthesis lut_function=(A (C (D))+!A (B (C)+!B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:62])
    defparam i189_2_lut_rep_86_3_lut_4_lut.init = 16'hf040;
    LUT4 i399_2_lut_rep_81_3_lut_4_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), 
         .C(wb_dat_o[4]), .D(spi_idle), .Z(n8244)) /* synthesis lut_function=(A (C+(D))+!A (B+(C+(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:62])
    defparam i399_2_lut_rep_81_3_lut_4_lut.init = 16'hfff4;
    FD1P3DX irq_en_i0_i3 (.D(wb_dat_o[3]), .SP(n3747), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(irq_en[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam irq_en_i0_i3.GSR = "DISABLED";
    PFUMX i6248 (.BLUT(n8195), .ALUT(n8194), .C0(n399[1]), .Z(n8196));
    LUT4 i4367_2_lut_4_lut_1_lut (.A(wb_ack_o), .Z(n1464[1])) /* synthesis lut_function=(A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam i4367_2_lut_4_lut_1_lut.init = 16'haaaa;
    LUT4 i2350_2_lut_rep_80_3_lut_4_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), 
         .C(wb_dat_o[3]), .D(spi_idle), .Z(n8243)) /* synthesis lut_function=(A (C+(D))+!A (B+(C+(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:62])
    defparam i2350_2_lut_rep_80_3_lut_4_lut.init = 16'hfff4;
    LUT4 i1_2_lut_rep_88_3_lut_4_lut (.A(spi_csn_buf2_p), .B(spi_csn_buf1_p), 
         .C(wb_ack_o), .D(spi_idle), .Z(n8251)) /* synthesis lut_function=(!(A ((D)+!C)+!A (B+((D)+!C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:62])
    defparam i1_2_lut_rep_88_3_lut_4_lut.init = 16'h00b0;
    FD1P3DX irq_en_i0_i2 (.D(wb_dat_o[2]), .SP(n3747), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(irq_en[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam irq_en_i0_i2.GSR = "DISABLED";
    LUT4 i4_4_lut (.A(n7_adj_4), .B(n399[5]), .C(n6_adj_5), .D(n55_adj_6), 
         .Z(n7535)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i4_4_lut.init = 16'hfefa;
    FD1P3DX irq_en_i0_i1 (.D(wb_dat_o[1]), .SP(n3747), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(irq_en[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam irq_en_i0_i1.GSR = "DISABLED";
    FD1P3BX spi_cmd_i0_i3 (.D(n7739), .SP(n444), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(spi_cmd[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam spi_cmd_i0_i3.GSR = "DISABLED";
    FD1P3DX spi_cmd_i0_i2 (.D(n7753), .SP(n444), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(spi_cmd[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam spi_cmd_i0_i2.GSR = "DISABLED";
    FD1P3BX spi_cmd_i0_i1 (.D(n7734), .SP(n444), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(spi_cmd[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam spi_cmd_i0_i1.GSR = "DISABLED";
    LUT4 i421_2_lut_rep_123 (.A(wb_ack_o), .B(n399[10]), .Z(n8286)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i421_2_lut_rep_123.init = 16'h8888;
    LUT4 i2_4_lut_adj_24 (.A(wb_ack_o), .B(spi_cmd[3]), .C(n46_adj_7), 
         .D(n52_adj_8), .Z(n7_adj_4)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2_4_lut_adj_24.init = 16'heca0;
    LUT4 i1_4_lut_adj_25 (.A(n7775), .B(n399[0]), .C(n8263), .D(n8262), 
         .Z(n6_adj_5)) /* synthesis lut_function=(A+!((C (D))+!B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_adj_25.init = 16'haeee;
    LUT4 i2_4_lut_adj_26 (.A(n8293), .B(n31), .C(n7861), .D(n146), .Z(n7739)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;
    defparam i2_4_lut_adj_26.init = 16'hffdf;
    LUT4 i6039_4_lut (.A(wb_dat_o[2]), .B(n4679), .C(n4695), .D(wb_dat_o[3]), 
         .Z(n7861)) /* synthesis lut_function=(A (B)+!A (B (C+!(D)))) */ ;
    defparam i6039_4_lut.init = 16'hc8cc;
    LUT4 i3_4_lut_adj_27 (.A(wb_dat_o[7]), .B(n7758), .C(wb_dat_o[5]), 
         .D(n7776), .Z(n31)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i3_4_lut_adj_27.init = 16'h0800;
    LUT4 i1_4_lut_adj_28 (.A(n24), .B(n44), .C(n399[10]), .D(spi_cmd[1]), 
         .Z(n46_adj_7)) /* synthesis lut_function=(A (B)+!A (B+(C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_adj_28.init = 16'hdccc;
    LUT4 i4426_2_lut_4_lut (.A(spi_cmd[0]), .B(n8273), .C(spi_cmd[1]), 
         .D(n808), .Z(n6224)) /* synthesis lut_function=(A (B ((D)+!C)+!B (D))+!A (B (C+(D))+!B (D))) */ ;
    defparam i4426_2_lut_4_lut.init = 16'hff48;
    PFUMX i6195 (.BLUT(n8096), .ALUT(n8095), .C0(n399[9]), .Z(n8097));
    LUT4 i1_2_lut_rep_84_4_lut (.A(n8275), .B(spi_cmd[1]), .C(spi_cmd[0]), 
         .D(n399[10]), .Z(n8247)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(433[27:34])
    defparam i1_2_lut_rep_84_4_lut.init = 16'h1000;
    LUT4 mux_886_i1_3_lut_4_lut (.A(wb_ack_o), .B(n399[10]), .C(n8259), 
         .D(n298), .Z(n1458[0])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A !(D)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam mux_886_i1_3_lut_4_lut.init = 16'h80f7;
    LUT4 i6158_2_lut_rep_89_3_lut_3_lut (.A(wb_ack_o), .B(n399[10]), .C(n399[8]), 
         .Z(n8252)) /* synthesis lut_function=(A (B+(C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6158_2_lut_rep_89_3_lut_3_lut.init = 16'ha8a8;
    LUT4 mux_886_i2_3_lut_4_lut (.A(wb_ack_o), .B(n399[10]), .C(n8259), 
         .D(n298), .Z(n1458[1])) /* synthesis lut_function=(!(A (B (C)+!B !(D))+!A !(D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam mux_886_i2_3_lut_4_lut.init = 16'h7f08;
    LUT4 i1_2_lut_3_lut_adj_29 (.A(spi_cmd[0]), .B(spi_cmd[1]), .C(irq_en[2]), 
         .Z(n7768)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_2_lut_3_lut_adj_29.init = 16'h1010;
    LUT4 i76_4_lut (.A(n8277), .B(n399[5]), .C(spi_cmd[2]), .D(n8274), 
         .Z(n52_adj_8)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i76_4_lut.init = 16'hcac0;
    LUT4 i1_2_lut_3_lut_adj_30 (.A(spi_cmd[0]), .B(spi_cmd[1]), .C(irq_en[3]), 
         .Z(n7769)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_2_lut_3_lut_adj_30.init = 16'h1010;
    LUT4 i1_2_lut_4_lut (.A(n8288), .B(n8298), .C(wb_dat_o[1]), .D(wb_dat_o[0]), 
         .Z(n4747)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(282[27:36])
    defparam i1_2_lut_4_lut.init = 16'h0400;
    LUT4 i1_4_lut_adj_31 (.A(n4698), .B(n4690), .C(n4708), .D(n4747), 
         .Z(n7753)) /* synthesis lut_function=(A+(((D)+!C)+!B)) */ ;
    defparam i1_4_lut_adj_31.init = 16'hffbf;
    LUT4 i4403_2_lut_4_lut (.A(n8288), .B(n8298), .C(wb_dat_o[1]), .D(wb_dat_o[0]), 
         .Z(n6201)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(282[27:36])
    defparam i4403_2_lut_4_lut.init = 16'hfffb;
    LUT4 i1_2_lut_4_lut_adj_32 (.A(wb_dat_o[5]), .B(wb_dat_o[6]), .C(n8294), 
         .D(wb_dat_o[2]), .Z(n7801)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(292[27:36])
    defparam i1_2_lut_4_lut_adj_32.init = 16'hfffe;
    LUT4 i20_3_lut (.A(spi_cmd[2]), .B(spi_cmd[3]), .C(spi_cmd[0]), .Z(n24)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i20_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut_adj_33 (.A(n8261), .B(n7744), .C(n399[7]), .D(n399[11]), 
         .Z(n44)) /* synthesis lut_function=(A (B+(C+(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_adj_33.init = 16'haaa8;
    LUT4 i2_4_lut_adj_34 (.A(n7773), .B(n8275), .C(spi_cmd[0]), .D(spi_cmd[1]), 
         .Z(n7775)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2_4_lut_adj_34.init = 16'h0002;
    LUT4 i1_4_lut_adj_35 (.A(n8247), .B(n8291), .C(n399[9]), .D(n399[3]), 
         .Z(n7744)) /* synthesis lut_function=(A+!(B+!(C+(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_adj_35.init = 16'hbbba;
    LUT4 i103_4_lut_4_lut_4_lut (.A(wb_ack_o), .B(wb_dat_o[3]), .C(wb_dat_o[4]), 
         .D(n8261), .Z(n263)) /* synthesis lut_function=(!((B (D)+!B (C+(D)))+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam i103_4_lut_4_lut_4_lut.init = 16'h008a;
    LUT4 i1_2_lut_3_lut_adj_36 (.A(wb_dat_o[0]), .B(wb_dat_o[1]), .C(n7810), 
         .Z(n4695)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(289[27:39])
    defparam i1_2_lut_3_lut_adj_36.init = 16'hfbfb;
    LUT4 i1_4_lut_adj_37 (.A(n8290), .B(n7732), .C(n4_adj_9), .D(n8295), 
         .Z(n7734)) /* synthesis lut_function=(A (B+!(C))+!A (B+!(C (D)))) */ ;
    defparam i1_4_lut_adj_37.init = 16'hcfdf;
    FD1P3DX wr_data_i0_i0 (.D(n777), .SP(n8238), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(wr_data[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=21, LSE_LLINE=193, LSE_RLINE=220 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam wr_data_i0_i0.GSR = "DISABLED";
    LUT4 i179_2_lut_rep_126 (.A(wb_ack_o), .B(wb_dat_o[4]), .Z(n8289)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(501[31:57])
    defparam i179_2_lut_rep_126.init = 16'h8888;
    CCU2D mem_addr_2062_add_4_9 (.A0(MEM_ADDR[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n7295), .S0(n38[7]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_add_4_9.INIT0 = 16'hfaaa;
    defparam mem_addr_2062_add_4_9.INIT1 = 16'h0000;
    defparam mem_addr_2062_add_4_9.INJECT1_0 = "NO";
    defparam mem_addr_2062_add_4_9.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_adj_38 (.A(wb_ack_o), .B(wb_dat_o[4]), .C(n399[7]), 
         .Z(n7796)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(501[31:57])
    defparam i1_2_lut_3_lut_adj_38.init = 16'h8080;
    LUT4 i913_3_lut_4_lut (.A(wb_ack_o), .B(wb_dat_o[4]), .C(n399[11]), 
         .D(n399[5]), .Z(n3809)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A !(C+!(D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(501[31:57])
    defparam i913_3_lut_4_lut.init = 16'h8f80;
    LUT4 i429_2_lut_rep_106_3_lut (.A(wb_ack_o), .B(wb_dat_o[4]), .C(n399[11]), 
         .Z(n8269)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(501[31:57])
    defparam i429_2_lut_rep_106_3_lut.init = 16'h8080;
    LUT4 i2413_4_lut_4_lut (.A(wb_ack_o), .B(wb_dat_o[4]), .C(n399[2]), 
         .D(n8239), .Z(n4160)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A (D)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(501[31:57])
    defparam i2413_4_lut_4_lut.init = 16'hf7a0;
    CCU2D mem_addr_2062_add_4_3 (.A0(MEM_ADDR[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(MEM_ADDR[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n7292), .COUT(n7293), .S0(n38[1]), .S1(n38[2]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_add_4_3.INIT0 = 16'hfaaa;
    defparam mem_addr_2062_add_4_3.INIT1 = 16'hfaaa;
    defparam mem_addr_2062_add_4_3.INJECT1_0 = "NO";
    defparam mem_addr_2062_add_4_3.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_4_lut_4_lut_adj_39 (.A(wb_ack_o), .B(wb_dat_o[4]), 
         .C(n399[3]), .D(n8243), .Z(n7395)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(501[31:57])
    defparam i1_2_lut_3_lut_4_lut_4_lut_adj_39.init = 16'h0080;
    LUT4 i1_2_lut_rep_127 (.A(wb_dat_o[3]), .B(n7801), .Z(n8290)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(291[27:37])
    defparam i1_2_lut_rep_127.init = 16'heeee;
    LUT4 i1_2_lut_3_lut_4_lut_adj_40 (.A(wb_dat_o[3]), .B(n7801), .C(wb_dat_o[1]), 
         .D(wb_dat_o[0]), .Z(n4690)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(291[27:37])
    defparam i1_2_lut_3_lut_4_lut_adj_40.init = 16'hffef;
    LUT4 i2364_2_lut_4_lut (.A(n8275), .B(spi_cmd[1]), .C(spi_cmd[0]), 
         .D(wb_ack_o), .Z(n4106)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(433[27:34])
    defparam i2364_2_lut_4_lut.init = 16'h1000;
    LUT4 n406_bdd_3_lut_6257_4_lut_4_lut (.A(wb_ack_o), .B(wb_dat_o[3]), 
         .C(spi_idle), .D(n8281), .Z(n8095)) /* synthesis lut_function=((B+!(C+(D)))+!A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam n406_bdd_3_lut_6257_4_lut_4_lut.init = 16'hdddf;
    LUT4 i4377_2_lut_4_lut (.A(n8275), .B(spi_cmd[1]), .C(spi_cmd[0]), 
         .D(n8286), .Z(n3822)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(433[27:34])
    defparam i4377_2_lut_4_lut.init = 16'h1000;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut_adj_41 (.A(wb_ack_o), .B(wb_dat_o[3]), 
         .C(n8261), .D(wb_dat_o[4]), .Z(n21)) /* synthesis lut_function=((B+!(C+(D)))+!A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam i1_2_lut_3_lut_4_lut_4_lut_adj_41.init = 16'hdddf;
    LUT4 i4396_2_lut_rep_129 (.A(wb_dat_o[0]), .B(wb_dat_o[1]), .Z(n8292)) /* synthesis lut_function=(A (B)) */ ;
    defparam i4396_2_lut_rep_129.init = 16'h8888;
    LUT4 i1_3_lut_4_lut_adj_42 (.A(wb_dat_o[0]), .B(wb_dat_o[1]), .C(wb_dat_o[4]), 
         .D(wb_dat_o[6]), .Z(n7758)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;
    defparam i1_3_lut_4_lut_adj_42.init = 16'h0080;
    LUT4 i2_3_lut_4_lut_adj_43 (.A(wb_dat_o[0]), .B(wb_dat_o[1]), .C(wb_dat_o[3]), 
         .D(n7801), .Z(n4708)) /* synthesis lut_function=((((D)+!C)+!B)+!A) */ ;
    defparam i2_3_lut_4_lut_adj_43.init = 16'hff7f;
    LUT4 i2_3_lut_rep_130 (.A(wb_dat_o[3]), .B(wb_dat_o[2]), .C(n8296), 
         .Z(n8293)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(291[27:37])
    defparam i2_3_lut_rep_130.init = 16'hfefe;
    LUT4 i1_2_lut_4_lut_adj_44 (.A(wb_dat_o[3]), .B(wb_dat_o[2]), .C(n8296), 
         .D(n4708), .Z(n4_adj_9)) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(291[27:37])
    defparam i1_2_lut_4_lut_adj_44.init = 16'hfe00;
    LUT4 i2415_4_lut_4_lut (.A(wb_ack_o), .B(wb_dat_o[3]), .C(n399[3]), 
         .D(n399[4]), .Z(n4162)) /* synthesis lut_function=(A (B (C))+!A (D)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam i2415_4_lut_4_lut.init = 16'hd580;
    LUT4 i1_2_lut_4_lut_4_lut (.A(wb_ack_o), .B(wb_dat_o[3]), .C(n8266), 
         .D(n399[9]), .Z(n4_adj_11)) /* synthesis lut_function=((B (C+(D)))+!A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam i1_2_lut_4_lut_4_lut.init = 16'hddd5;
    CCU2D mem_addr_2062_add_4_7 (.A0(MEM_ADDR[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(MEM_ADDR[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n7294), .COUT(n7295), .S0(n38[5]), .S1(n38[6]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_add_4_7.INIT0 = 16'hfaaa;
    defparam mem_addr_2062_add_4_7.INIT1 = 16'hfaaa;
    defparam mem_addr_2062_add_4_7.INJECT1_0 = "NO";
    defparam mem_addr_2062_add_4_7.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_45 (.A(n49_adj_12), .B(wb_dat_o[0]), .C(n8294), 
         .D(n58), .Z(n146)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C))+!A (B (D)))) */ ;
    defparam i1_4_lut_adj_45.init = 16'h31f5;
    LUT4 mem_addr_2062_mux_6_i8_4_lut (.A(wb_dat_o[7]), .B(n38[7]), .C(n808), 
         .D(n8258), .Z(n48[7])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i8_4_lut.init = 16'hcac0;
    LUT4 i1_4_lut_adj_46 (.A(n6239), .B(wb_dat_o[1]), .C(n4_adj_13), .D(n55_adj_2), 
         .Z(n49_adj_12)) /* synthesis lut_function=(A (B (D))+!A (B (C+(D))+!B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_top.v(105[43:51])
    defparam i1_4_lut_adj_46.init = 16'hdc50;
    PFUMX i6241 (.BLUT(n8170), .ALUT(n8169), .C0(spi_cmd[3]), .Z(n8171));
    LUT4 i1_4_lut_adj_47 (.A(wb_dat_o[2]), .B(wb_dat_o[3]), .C(wb_dat_o[0]), 
         .D(wb_dat_o[1]), .Z(n4_adj_13)) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B+(C (D)+!C !(D))))) */ ;
    defparam i1_4_lut_adj_47.init = 16'h0332;
    LUT4 i134_2_lut_rep_128 (.A(wb_ack_o), .B(wb_dat_o[3]), .Z(n8291)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam i134_2_lut_rep_128.init = 16'h8888;
    LUT4 i1_2_lut_rep_132 (.A(wb_dat_o[1]), .B(wb_dat_o[0]), .Z(n8295)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(290[27:36])
    defparam i1_2_lut_rep_132.init = 16'hbbbb;
    LUT4 i1_2_lut_3_lut_rep_133 (.A(wb_dat_o[1]), .B(wb_dat_o[0]), .C(n7810), 
         .Z(n8296)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(290[27:36])
    defparam i1_2_lut_3_lut_rep_133.init = 16'hfbfb;
    LUT4 i11_4_lut (.A(n399[9]), .B(wr_en), .C(n399[12]), .D(MEM_WR), 
         .Z(n808)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i11_4_lut.init = 16'hcac0;
    LUT4 i1_2_lut_4_lut_adj_48 (.A(wb_dat_o[1]), .B(wb_dat_o[0]), .C(n7810), 
         .D(n8298), .Z(n4679)) /* synthesis lut_function=(A+((C+!(D))+!B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(290[27:36])
    defparam i1_2_lut_4_lut_adj_48.init = 16'hfbff;
    LUT4 i2_3_lut_rep_134 (.A(wb_dat_o[6]), .B(wb_dat_o[5]), .C(wb_dat_o[3]), 
         .Z(n8297)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(280[27] 294[34])
    defparam i2_3_lut_rep_134.init = 16'h0808;
    LUT4 i40_2_lut_rep_87_4_lut (.A(n8284), .B(wb_ack_o), .C(wb_sm), .D(n8263), 
         .Z(n8250)) /* synthesis lut_function=(A (B (C (D)))+!A (B (D)+!B !(C+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i40_2_lut_rep_87_4_lut.init = 16'hc500;
    LUT4 i1_2_lut_4_lut_adj_49 (.A(wb_dat_o[6]), .B(wb_dat_o[5]), .C(wb_dat_o[3]), 
         .D(wb_dat_o[0]), .Z(n7737)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(280[27] 294[34])
    defparam i1_2_lut_4_lut_adj_49.init = 16'h0008;
    LUT4 i255_2_lut_3_lut (.A(wb_ack_o), .B(wb_dat_o[3]), .C(n399[9]), 
         .Z(n462)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(439[31:57])
    defparam i255_2_lut_3_lut.init = 16'h8080;
    LUT4 i1_2_lut_3_lut_4_lut_adj_50 (.A(n8286), .B(spi_cmd[3]), .C(n7_adj_3), 
         .D(spi_cmd[0]), .Z(n3751)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_50.init = 16'h2000;
    LUT4 i4453_3_lut_4_lut (.A(n8281), .B(spi_idle), .C(wb_dat_o[3]), 
         .D(wb_ack_o), .Z(n6252)) /* synthesis lut_function=(A (C (D))+!A (B (C (D))+!B (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:73])
    defparam i4453_3_lut_4_lut.init = 16'hf100;
    LUT4 mem_addr_2062_mux_6_i7_4_lut (.A(wb_dat_o[6]), .B(n38[6]), .C(n808), 
         .D(n8258), .Z(n48[6])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i7_4_lut.init = 16'hcac0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_51 (.A(n8281), .B(spi_idle), .C(n399[11]), 
         .D(n8289), .Z(n7773)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:73])
    defparam i1_2_lut_3_lut_4_lut_adj_51.init = 16'h1000;
    LUT4 mem_addr_2062_mux_6_i6_4_lut (.A(wb_dat_o[5]), .B(n38[5]), .C(n808), 
         .D(n8258), .Z(n48[5])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i6_4_lut.init = 16'hcac0;
    LUT4 i4441_2_lut (.A(wb_dat_o[5]), .B(wb_dat_o[6]), .Z(n6239)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i4441_2_lut.init = 16'heeee;
    LUT4 i1_2_lut (.A(wb_dat_o[2]), .B(wb_dat_o[3]), .Z(n7776)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut.init = 16'h8888;
    LUT4 i2409_3_lut_4_lut (.A(n8250), .B(n399[0]), .C(wb_ack_o), .D(n399[1]), 
         .Z(n4156)) /* synthesis lut_function=(A (B+!(C+!(D)))+!A !(C+!(D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam i2409_3_lut_4_lut.init = 16'h8f88;
    LUT4 i1_3_lut_4_lut_adj_52 (.A(n8281), .B(spi_idle), .C(n1138), .D(spi_cmd[3]), 
         .Z(n55_adj_6)) /* synthesis lut_function=(A+(B+!(C+(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:73])
    defparam i1_3_lut_4_lut_adj_52.init = 16'heeef;
    LUT4 mem_addr_2062_mux_6_i5_4_lut (.A(wb_dat_o[4]), .B(n38[4]), .C(n808), 
         .D(n8258), .Z(n48[4])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i5_4_lut.init = 16'hcac0;
    LUT4 mem_addr_2062_mux_6_i4_4_lut (.A(wb_dat_o[3]), .B(n38[3]), .C(n808), 
         .D(n8258), .Z(n48[3])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i4_4_lut.init = 16'hcac0;
    LUT4 i4365_2_lut_rep_77_3_lut_4_lut (.A(n8281), .B(spi_idle), .C(wb_ack_o), 
         .D(wb_dat_o[3]), .Z(n8240)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:73])
    defparam i4365_2_lut_rep_77_3_lut_4_lut.init = 16'hf0e0;
    LUT4 i3_4_lut_adj_53 (.A(n5), .B(n8269), .C(n7869), .D(n8305), .Z(n7755)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;
    defparam i3_4_lut_adj_53.init = 16'h0200;
    LUT4 i6047_4_lut (.A(n8249), .B(n399[9]), .C(n399[11]), .D(n8291), 
         .Z(n7869)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))) */ ;
    defparam i6047_4_lut.init = 16'ha0a8;
    LUT4 i11_3_lut_4_lut (.A(n8250), .B(n399[0]), .C(n399[8]), .D(n4106), 
         .Z(n4872)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(228[17] 551[11])
    defparam i11_3_lut_4_lut.init = 16'hf808;
    LUT4 i2_3_lut_4_lut_adj_54 (.A(n8281), .B(spi_idle), .C(n8291), .D(n399[7]), 
         .Z(n7324)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(200[28:73])
    defparam i2_3_lut_4_lut_adj_54.init = 16'h1000;
    LUT4 i1_4_lut_adj_55 (.A(n4624), .B(n21), .C(n8097), .D(n8266), 
         .Z(n1359)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i1_4_lut_adj_55.init = 16'hfefa;
    LUT4 i4331_2_lut (.A(n298), .B(wb_ack_o), .Z(n329)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(404[24] 436[27])
    defparam i4331_2_lut.init = 16'h8888;
    LUT4 mem_addr_2062_mux_6_i3_4_lut (.A(wb_dat_o[2]), .B(n38[2]), .C(n808), 
         .D(n8258), .Z(n48[2])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i3_4_lut.init = 16'hcac0;
    PFUMX i6278 (.BLUT(n8306), .ALUT(n8307), .C0(n8240), .Z(n8308));
    LUT4 mem_addr_2062_mux_6_i2_4_lut (.A(wb_dat_o[1]), .B(n38[1]), .C(n808), 
         .D(n8258), .Z(n48[1])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(541[42:54])
    defparam mem_addr_2062_mux_6_i2_4_lut.init = 16'hcac0;
    LUT4 i2462_4_lut (.A(n8265), .B(n8289), .C(n8266), .D(n8240), .Z(n4210)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i2462_4_lut.init = 16'h0aca;
    PFUMX i6276 (.BLUT(n8303), .ALUT(n8304), .C0(wb_ack_o), .Z(n8305));
    LUT4 i6113_4_lut (.A(n12), .B(n7465), .C(n399[11]), .D(n7785), .Z(n4211)) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6113_4_lut.init = 16'hc5c0;
    LUT4 i6140_2_lut (.A(n399[11]), .B(n399[5]), .Z(n7920)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6140_2_lut.init = 16'heeee;
    PFUMX i6274 (.BLUT(n8300), .ALUT(n8301), .C0(n8269), .Z(n8302));
    LUT4 i6122_4_lut (.A(n1458[0]), .B(n1359), .C(n8479), .D(n4_adj_11), 
         .Z(n1471[0])) /* synthesis lut_function=(A ((C+(D))+!B)+!A !(B (C+!(D))+!B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/spi_slave_ctrl.v(239[11] 550[18])
    defparam i6122_4_lut.init = 16'hafa3;
    
endmodule
//
// Verilog Description of module ext_if
//

module ext_if (MAIN_CLK, POWERUP_RST, gpi_ld, gpio_din, FIFOStatus, 
            \GPO_Reg[1] , \gpio_dout[1] , \GPO_Reg[0] , \gpio_dout[0] , 
            gpio_addr) /* synthesis syn_module_defined=1 */ ;
    input MAIN_CLK;
    input POWERUP_RST;
    input gpi_ld;
    output [7:0]gpio_din;
    input [7:0]FIFOStatus;
    output \GPO_Reg[1] ;
    input \gpio_dout[1] ;
    output \GPO_Reg[0] ;
    input \gpio_dout[0] ;
    input [7:0]gpio_addr;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    
    wire gpi_ld_buf, n2101;
    wire [7:0]gpi_reg;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(93[43:50])
    
    wire n31, n2108, n2107, n2106, n2105, n2104, n2103, n2102, 
        n4567, n14, n10;
    
    FD1S3DX gpi_ld_buf_90 (.D(gpi_ld), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(gpi_ld_buf)) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(134[11:32])
    defparam gpi_ld_buf_90.GSR = "DISABLED";
    FD1S3DX gpio_din_i0 (.D(n2101), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i0.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i0 (.D(FIFOStatus[0]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[0])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i0.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i7 (.D(FIFOStatus[7]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[7])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i7.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i6 (.D(FIFOStatus[6]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[6])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i6.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i5 (.D(FIFOStatus[5]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[5])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i5.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i4 (.D(FIFOStatus[4]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[4])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i4.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i3 (.D(FIFOStatus[3]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i3.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i2 (.D(FIFOStatus[2]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i2.GSR = "DISABLED";
    FD1P3DX gpi_reg_i0_i1 (.D(FIFOStatus[1]), .SP(n31), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(gpi_reg[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[13] 141[26])
    defparam gpi_reg_i0_i1.GSR = "DISABLED";
    FD1S3DX gpio_din_i7 (.D(n2108), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[7])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i7.GSR = "DISABLED";
    FD1S3DX gpio_din_i6 (.D(n2107), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[6])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i6.GSR = "DISABLED";
    FD1S3DX gpio_din_i5 (.D(n2106), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[5])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i5.GSR = "DISABLED";
    FD1S3DX gpio_din_i4 (.D(n2105), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[4])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i4.GSR = "DISABLED";
    FD1S3DX gpio_din_i3 (.D(n2104), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[3])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i3.GSR = "DISABLED";
    FD1S3DX gpio_din_i2 (.D(n2103), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[2])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i2.GSR = "DISABLED";
    FD1S3DX gpio_din_i1 (.D(n2102), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(gpio_din[1])) /* synthesis LSE_LINE_FILE_ID=7, LSE_LCOL=4, LSE_RCOL=18, LSE_LLINE=232, LSE_RLINE=258 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(153[10] 154[70])
    defparam gpio_din_i1.GSR = "DISABLED";
    LUT4 i4413_4_lut (.A(FIFOStatus[7]), .B(n4567), .C(gpi_reg[7]), .D(gpi_ld), 
         .Z(n2108)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4413_4_lut.init = 16'hf3bb;
    LUT4 i4436_4_lut (.A(FIFOStatus[6]), .B(n4567), .C(gpi_reg[6]), .D(gpi_ld), 
         .Z(n2107)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4436_4_lut.init = 16'hf3bb;
    LUT4 i4414_4_lut (.A(FIFOStatus[5]), .B(n4567), .C(gpi_reg[5]), .D(gpi_ld), 
         .Z(n2106)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4414_4_lut.init = 16'hf3bb;
    LUT4 i4415_4_lut (.A(FIFOStatus[4]), .B(n4567), .C(gpi_reg[4]), .D(gpi_ld), 
         .Z(n2105)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4415_4_lut.init = 16'hf3bb;
    LUT4 i4433_4_lut (.A(FIFOStatus[3]), .B(n4567), .C(gpi_reg[3]), .D(gpi_ld), 
         .Z(n2104)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4433_4_lut.init = 16'hf3bb;
    LUT4 i4428_4_lut (.A(FIFOStatus[2]), .B(n4567), .C(gpi_reg[2]), .D(gpi_ld), 
         .Z(n2103)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4428_4_lut.init = 16'hf3bb;
    LUT4 i4422_4_lut (.A(FIFOStatus[1]), .B(n4567), .C(gpi_reg[1]), .D(gpi_ld), 
         .Z(n2102)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4422_4_lut.init = 16'hf3bb;
    FD1P3DX gpo_reg_tmp_1__94 (.D(\gpio_dout[1] ), .SP(n4567), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(\GPO_Reg[1] ));   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(184[7] 185[61])
    defparam gpo_reg_tmp_1__94.GSR = "DISABLED";
    FD1P3DX gpo_reg_tmp_0__93 (.D(\gpio_dout[0] ), .SP(n4567), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(\GPO_Reg[0] ));   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(184[7] 185[61])
    defparam gpo_reg_tmp_0__93.GSR = "DISABLED";
    LUT4 i4425_4_lut (.A(FIFOStatus[0]), .B(n4567), .C(gpi_reg[0]), .D(gpi_ld), 
         .Z(n2101)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i4425_4_lut.init = 16'hf3bb;
    LUT4 i6156_4_lut (.A(gpio_addr[0]), .B(n14), .C(n10), .D(gpio_addr[7]), 
         .Z(n4567)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(184[10:24])
    defparam i6156_4_lut.init = 16'h0001;
    LUT4 i6_4_lut (.A(gpio_addr[4]), .B(gpio_addr[1]), .C(gpio_addr[6]), 
         .D(gpio_addr[3]), .Z(n14)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i6_4_lut.init = 16'hfffe;
    LUT4 i2_2_lut (.A(gpio_addr[2]), .B(gpio_addr[5]), .Z(n10)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i31_2_lut (.A(gpi_ld), .B(gpi_ld_buf), .Z(n31)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/ext_if.v(140[17:38])
    defparam i31_2_lut.init = 16'h2222;
    
endmodule
//
// Verilog Description of module fifo_ctrl
//

module fifo_ctrl (MAIN_CLK, VCC_net, GND_net, PARALLEL_DATA_IO_out_4, 
            RX_RdClock, MEM_WR, PARALLEL_WR_c, PARALLEL_RDN_c, PARALLEL_DATA_IO_out_1, 
            PARALLEL_DATA_IO_out_0, PARALLEL_DATA_IO_out_6, PARALLEL_RXFILLEDN_c, 
            PARALLEL_DATA_IO_out_5, PARALLEL_DATA_IO_out_7, PARALLEL_DATA_IO_out_3, 
            PARALLEL_DATA_IO_out_2, n4017, n8299, n68, POWERUP_RST, 
            n8481, n6, FIFOStatus, PARALLEL_TXENABLEDN_c, n200, MEM_ADDR, 
            n178, n3786, n8480, n177, n4067, TXData, RXData, RX_Q, 
            RXFN_INHIBIT);
    input MAIN_CLK;
    input VCC_net;
    input GND_net;
    input PARALLEL_DATA_IO_out_4;
    input RX_RdClock;
    input MEM_WR;
    input PARALLEL_WR_c;
    input PARALLEL_RDN_c;
    input PARALLEL_DATA_IO_out_1;
    input PARALLEL_DATA_IO_out_0;
    input PARALLEL_DATA_IO_out_6;
    output PARALLEL_RXFILLEDN_c;
    input PARALLEL_DATA_IO_out_5;
    input PARALLEL_DATA_IO_out_7;
    input PARALLEL_DATA_IO_out_3;
    input PARALLEL_DATA_IO_out_2;
    output n4017;
    input n8299;
    input n68;
    input POWERUP_RST;
    input n8481;
    output n6;
    output [7:0]FIFOStatus;
    output PARALLEL_TXENABLEDN_c;
    input n200;
    input [7:0]MEM_ADDR;
    output n178;
    input n3786;
    input n8480;
    output n177;
    input n4067;
    output [7:0]TXData;
    input [7:0]RXData;
    output [7:0]RX_Q;
    input RXFN_INHIBIT;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire n8481 /* synthesis nomerge= */ ;
    wire n8480 /* synthesis nomerge= */ ;
    wire [7:0]TX_Latch;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(117[9:17])
    
    wire RX_RdEn, n156, RX_WrEn, tmp_PARALLEL_WR_P, TX_WrEn, n7339, 
        tmp_PARALLEL_WR_N, tmp_PARALLEL_RDN_P, tmp_PARALLEL_RDN_N;
    wire [7:0]TX_Data;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(96[12:19])
    
    wire n7377;
    wire [1:0]DEBUG_OUT;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(35[3:12])
    wire [7:0]TX_Q;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(103[12:16])
    
    IFS1P3DX TX_Latch_i4 (.D(PARALLEL_DATA_IO_out_4), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[4])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i4.GSR = "DISABLED";
    FD1S3AX RX_RdEn_92 (.D(n156), .CK(RX_RdClock), .Q(RX_RdEn)) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(201[3] 210[10])
    defparam RX_RdEn_92.GSR = "DISABLED";
    FD1S3AX tmp_RXFIFO_WREN_93 (.D(MEM_WR), .CK(RX_RdClock), .Q(RX_WrEn)) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(201[3] 210[10])
    defparam tmp_RXFIFO_WREN_93.GSR = "DISABLED";
    IFS1P3DX tmp_PARALLEL_WR_P_95 (.D(PARALLEL_WR_c), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(tmp_PARALLEL_WR_P)) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam tmp_PARALLEL_WR_P_95.GSR = "DISABLED";
    FD1S3AX TX_WrEn_97 (.D(n7339), .CK(RX_RdClock), .Q(TX_WrEn)) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(237[3] 246[10])
    defparam TX_WrEn_97.GSR = "DISABLED";
    FD1S3AX tmp_PARALLEL_WR_N_98 (.D(PARALLEL_WR_c), .CK(RX_RdClock), .Q(tmp_PARALLEL_WR_N)) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(237[3] 246[10])
    defparam tmp_PARALLEL_WR_N_98.GSR = "DISABLED";
    IFS1P3DX tmp_PARALLEL_RDN_P_89 (.D(PARALLEL_RDN_c), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(tmp_PARALLEL_RDN_P)) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(193[3] 199[10])
    defparam tmp_PARALLEL_RDN_P_89.GSR = "DISABLED";
    IFS1P3DX TX_Latch_i1 (.D(PARALLEL_DATA_IO_out_1), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[1])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i1.GSR = "DISABLED";
    IFS1P3DX TX_Latch_i0 (.D(PARALLEL_DATA_IO_out_0), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[0])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i0.GSR = "DISABLED";
    IFS1P3DX TX_Latch_i6 (.D(PARALLEL_DATA_IO_out_6), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[6])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i6.GSR = "DISABLED";
    FD1S3AX tmp_PARALLEL_RDN_N_90 (.D(tmp_PARALLEL_RDN_P), .CK(MAIN_CLK), 
            .Q(tmp_PARALLEL_RDN_N)) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(193[3] 199[10])
    defparam tmp_PARALLEL_RDN_N_90.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i0 (.D(TX_Latch[0]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[0])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i0.GSR = "DISABLED";
    OFS1P3DX PARALLEL_RXFILLEDN_99 (.D(n7377), .SP(PARALLEL_RDN_c), .SCLK(RX_RdClock), 
            .CD(GND_net), .Q(PARALLEL_RXFILLEDN_c));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(256[3] 258[10])
    defparam PARALLEL_RXFILLEDN_99.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i7 (.D(TX_Latch[7]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[7])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i7.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i6 (.D(TX_Latch[6]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[6])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i6.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i5 (.D(TX_Latch[5]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[5])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i5.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i4 (.D(TX_Latch[4]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[4])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i4.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i3 (.D(TX_Latch[3]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[3])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i3.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i2 (.D(TX_Latch[2]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[2])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i2.GSR = "DISABLED";
    FD1P3AX TX_Data_i0_i1 (.D(TX_Latch[1]), .SP(tmp_PARALLEL_WR_P), .CK(MAIN_CLK), 
            .Q(TX_Data[1])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Data_i0_i1.GSR = "DISABLED";
    IFS1P3DX TX_Latch_i5 (.D(PARALLEL_DATA_IO_out_5), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[5])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i5.GSR = "DISABLED";
    IFS1P3DX TX_Latch_i7 (.D(PARALLEL_DATA_IO_out_7), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[7])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i7.GSR = "DISABLED";
    IFS1P3DX TX_Latch_i3 (.D(PARALLEL_DATA_IO_out_3), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[3])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i3.GSR = "DISABLED";
    IFS1P3DX TX_Latch_i2 (.D(PARALLEL_DATA_IO_out_2), .SP(VCC_net), .SCLK(MAIN_CLK), 
            .CD(GND_net), .Q(TX_Latch[2])) /* synthesis LSE_LINE_FILE_ID=28, LSE_LCOL=19, LSE_RCOL=28, LSE_LLINE=237, LSE_RLINE=237 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(229[3] 235[10])
    defparam TX_Latch_i2.GSR = "DISABLED";
    LUT4 i4317_2_lut (.A(PARALLEL_RDN_c), .B(PARALLEL_WR_c), .Z(n4017)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i4317_2_lut.init = 16'heeee;
    LUT4 i3086_4_lut (.A(tmp_PARALLEL_RDN_N), .B(PARALLEL_RDN_c), .C(tmp_PARALLEL_RDN_P), 
         .D(RX_RdEn), .Z(n156)) /* synthesis lut_function=(!(A (B (C+(D))+!B !(C+!(D)))+!A (B+!(C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(202[7] 203[86])
    defparam i3086_4_lut.init = 16'h303a;
    LUT4 i2_4_lut (.A(tmp_PARALLEL_WR_P), .B(TX_WrEn), .C(PARALLEL_WR_c), 
         .D(tmp_PARALLEL_WR_N), .Z(n7339)) /* synthesis lut_function=(!(A (B+(C+!(D)))+!A (B+!(D)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(239[8] 240[55])
    defparam i2_4_lut.init = 16'h1300;
    mono WR_busy (.GND_net(GND_net), .MAIN_CLK(MAIN_CLK), .n8299(n8299), 
         .n68(n68), .POWERUP_RST(POWERUP_RST), .n8481(n8481), .n6(n6), 
         .PARALLEL_WR_c(PARALLEL_WR_c), .\FIFOStatus[3] (FIFOStatus[3]), 
         .PARALLEL_TXENABLEDN_c(PARALLEL_TXENABLEDN_c), .RX_RdClock(RX_RdClock));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(133[12:48])
    fifo_prefetch_if TXIF (.RX_RdClock(RX_RdClock), .n8299(n8299), .n200(n200), 
            .MEM_ADDR({MEM_ADDR}), .POWERUP_RST(POWERUP_RST), .n174({Open_0, 
            Open_1, Open_2, n178}), .MAIN_CLK(MAIN_CLK), .\DEBUG_OUT[1] (DEBUG_OUT[1]), 
            .n3786(n3786), .n8480(n8480), .n177(n177), .\FIFOStatus[0] (FIFOStatus[0]), 
            .n4067(n4067), .TX_Q({TX_Q}), .VCC_net(VCC_net), .TXData({TXData}), 
            .GND_net(GND_net));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(155[9:59])
    fifo_dc TXFF (.TX_Data({TX_Data}), .MAIN_CLK(MAIN_CLK), .RX_RdClock(RX_RdClock), 
            .TX_WrEn(TX_WrEn), .\DEBUG_OUT[1] (DEBUG_OUT[1]), .POWERUP_RST(POWERUP_RST), 
            .GND_net(GND_net), .TX_Q({TX_Q}), .\FIFOStatus[0] (FIFOStatus[0]), 
            .\FIFOStatus[3] (FIFOStatus[3]), .\FIFOStatus[1] (FIFOStatus[1]), 
            .\FIFOStatus[2] (FIFOStatus[2]), .VCC_net(VCC_net)) /* synthesis NGD_DRC_MASK=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(147[9:16])
    fifo_dc_U0 RXFF (.RXData({RXData}), .MAIN_CLK(MAIN_CLK), .RX_RdClock(RX_RdClock), 
            .RX_WrEn(RX_WrEn), .RX_RdEn(RX_RdEn), .POWERUP_RST(POWERUP_RST), 
            .GND_net(GND_net), .RX_Q({RX_Q}), .\FIFOStatus[4] (FIFOStatus[4]), 
            .\FIFOStatus[7] (FIFOStatus[7]), .\FIFOStatus[5] (FIFOStatus[5]), 
            .\FIFOStatus[6] (FIFOStatus[6]), .VCC_net(VCC_net)) /* synthesis NGD_DRC_MASK=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(140[9:16])
    mono_U1 RD_busy (.RX_RdClock(RX_RdClock), .PARALLEL_RDN_c(PARALLEL_RDN_c), 
            .MAIN_CLK(MAIN_CLK), .n8481(n8481), .RXFN_INHIBIT(RXFN_INHIBIT), 
            .\FIFOStatus[4] (FIFOStatus[4]), .n7377(n7377));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(135[12:23])
    
endmodule
//
// Verilog Description of module mono
//

module mono (GND_net, MAIN_CLK, n8299, n68, POWERUP_RST, n8481, 
            n6, PARALLEL_WR_c, \FIFOStatus[3] , PARALLEL_TXENABLEDN_c, 
            RX_RdClock);
    input GND_net;
    input MAIN_CLK;
    input n8299;
    input n68;
    input POWERUP_RST;
    input n8481;
    output n6;
    input PARALLEL_WR_c;
    input \FIFOStatus[3] ;
    output PARALLEL_TXENABLEDN_c;
    input RX_RdClock;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire n8481 /* synthesis nomerge= */ ;
    
    wire n7289;
    wire [5:0]counter;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(22[9:16])
    wire [5:0]n12;
    
    wire n7290;
    wire [5:0]n26;
    
    wire n4989, n7291, n8276, n4991, n4990, n4, n4987, n79, 
        n4986, n77, n4985;
    
    CCU2D add_10_3 (.A0(counter[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(counter[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n7289), .COUT(n7290), .S0(n12[1]), .S1(n12[2]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam add_10_3.INIT0 = 16'h5aaa;
    defparam add_10_3.INIT1 = 16'h5aaa;
    defparam add_10_3.INJECT1_0 = "NO";
    defparam add_10_3.INJECT1_1 = "NO";
    FD1P3DX counter_i0 (.D(n26[0]), .SP(n8299), .CK(MAIN_CLK), .CD(n68), 
            .Q(counter[0])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam counter_i0.GSR = "DISABLED";
    FD1S1D i3191 (.D(n8481), .CK(POWERUP_RST), .CD(n68), .Q(n4989));   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam i3191.GSR = "DISABLED";
    CCU2D add_10_5 (.A0(counter[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(counter[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n7290), .COUT(n7291), .S0(n12[3]), .S1(n12[4]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam add_10_5.INIT0 = 16'h5aaa;
    defparam add_10_5.INIT1 = 16'h5aaa;
    defparam add_10_5.INJECT1_0 = "NO";
    defparam add_10_5.INJECT1_1 = "NO";
    CCU2D add_10_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(counter[0]), .B1(n8276), .C1(GND_net), .D1(GND_net), .COUT(n7289), 
          .S1(n12[0]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam add_10_1.INIT0 = 16'hF000;
    defparam add_10_1.INIT1 = 16'h5999;
    defparam add_10_1.INJECT1_0 = "NO";
    defparam add_10_1.INJECT1_1 = "NO";
    FD1P3DX counter_i4 (.D(n26[4]), .SP(n8299), .CK(MAIN_CLK), .CD(n68), 
            .Q(counter[4])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam counter_i4.GSR = "DISABLED";
    FD1P3DX counter_i3 (.D(n26[3]), .SP(n8299), .CK(MAIN_CLK), .CD(n68), 
            .Q(counter[3])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam counter_i3.GSR = "DISABLED";
    FD1P3DX counter_i2 (.D(n26[2]), .SP(n8299), .CK(MAIN_CLK), .CD(n68), 
            .Q(counter[2])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam counter_i2.GSR = "DISABLED";
    FD1P3DX counter_i1 (.D(n26[1]), .SP(n8299), .CK(MAIN_CLK), .CD(n68), 
            .Q(counter[1])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam counter_i1.GSR = "DISABLED";
    LUT4 i1_2_lut (.A(n6), .B(n12[4]), .Z(n26[4])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut.init = 16'h4444;
    LUT4 i1_2_lut_adj_1 (.A(n6), .B(n12[3]), .Z(n26[3])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut_adj_1.init = 16'h4444;
    LUT4 i1_2_lut_adj_2 (.A(n6), .B(n12[2]), .Z(n26[2])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut_adj_2.init = 16'h4444;
    LUT4 i1_2_lut_adj_3 (.A(n6), .B(n12[1]), .Z(n26[1])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut_adj_3.init = 16'h4444;
    LUT4 i3194_3_lut_rep_113 (.A(n4991), .B(n4990), .C(n4989), .Z(n8276)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam i3194_3_lut_rep_113.init = 16'hcaca;
    LUT4 i1_2_lut_4_lut (.A(n4991), .B(n4990), .C(n4989), .D(PARALLEL_WR_c), 
         .Z(n4)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam i1_2_lut_4_lut.init = 16'h00ca;
    LUT4 i88_2_lut_4_lut (.A(n4991), .B(n4990), .C(n4989), .D(\FIFOStatus[3] ), 
         .Z(PARALLEL_TXENABLEDN_c)) /* synthesis lut_function=(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam i88_2_lut_4_lut.init = 16'hff35;
    FD1S3DX delayed_inp_50_3188_3189_reset (.D(PARALLEL_WR_c), .CK(RX_RdClock), 
            .CD(n79), .Q(n4987)) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(41[4] 46[11])
    defparam delayed_inp_50_3188_3189_reset.GSR = "DISABLED";
    FD1S3BX delayed_inp_50_3188_3189_set (.D(PARALLEL_WR_c), .CK(RX_RdClock), 
            .PD(n77), .Q(n4986)) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(41[4] 46[11])
    defparam delayed_inp_50_3188_3189_set.GSR = "DISABLED";
    LUT4 i1_2_lut_adj_4 (.A(n6), .B(n12[0]), .Z(n26[0])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut_adj_4.init = 16'h4444;
    LUT4 i49_2_lut (.A(POWERUP_RST), .B(PARALLEL_WR_c), .Z(n79)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(41[4] 46[11])
    defparam i49_2_lut.init = 16'h2222;
    LUT4 i2_4_lut (.A(n4987), .B(n4), .C(n4986), .D(n4985), .Z(n6)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;
    defparam i2_4_lut.init = 16'hc088;
    LUT4 i47_2_lut (.A(POWERUP_RST), .B(PARALLEL_WR_c), .Z(n77)) /* synthesis lut_function=(A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(41[4] 46[11])
    defparam i47_2_lut.init = 16'h8888;
    CCU2D add_10_7 (.A0(n8276), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n7291), 
          .S0(n12[5]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam add_10_7.INIT0 = 16'h5aaa;
    defparam add_10_7.INIT1 = 16'h0000;
    defparam add_10_7.INJECT1_0 = "NO";
    defparam add_10_7.INJECT1_1 = "NO";
    FD1S1D i3187 (.D(n8481), .CK(n77), .CD(n79), .Q(n4985));   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(41[4] 46[11])
    defparam i3187.GSR = "DISABLED";
    FD1S3DX counter_i5_3192_3193_reset (.D(n26[5]), .CK(MAIN_CLK), .CD(n68), 
            .Q(n4991)) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam counter_i5_3192_3193_reset.GSR = "DISABLED";
    LUT4 i1_2_lut_adj_5 (.A(n6), .B(n12[5]), .Z(n26[5])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut_adj_5.init = 16'h4444;
    FD1S3BX counter_i5_3192_3193_set (.D(n26[5]), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(n4990)) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=48, LSE_LLINE=133, LSE_RLINE=133 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(28[4] 39[11])
    defparam counter_i5_3192_3193_set.GSR = "DISABLED";
    
endmodule
//
// Verilog Description of module fifo_prefetch_if
//

module fifo_prefetch_if (RX_RdClock, n8299, n200, MEM_ADDR, POWERUP_RST, 
            n174, MAIN_CLK, \DEBUG_OUT[1] , n3786, n8480, n177, 
            \FIFOStatus[0] , n4067, TX_Q, VCC_net, TXData, GND_net);
    input RX_RdClock;
    input n8299;
    input n200;
    input [7:0]MEM_ADDR;
    input POWERUP_RST;
    output [3:0]n174;
    input MAIN_CLK;
    output \DEBUG_OUT[1] ;
    input n3786;
    input n8480;
    output n177;
    input \FIFOStatus[0] ;
    input n4067;
    input [7:0]TX_Q;
    input VCC_net;
    output [7:0]TXData;
    input GND_net;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire n8480 /* synthesis nomerge= */ ;
    wire [7:0]WR_DATA;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(113[9:16])
    wire [7:0]tmp_WR_DATA;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(109[9:20])
    wire [1:0]CMD;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(104[9:12])
    
    wire WR_ENA, tmp_WR_ENA, n4105, n7575, n4101, n8248, n4269, 
        n4271, n4273, n4275, n4279, CMD_PENDING;
    wire [5:0]WR_ADDR;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(112[9:16])
    wire [5:0]tmp_WR_ADDR;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(108[9:20])
    
    wire n8267;
    wire [3:0]n174_c;
    
    wire n8285, n8254;
    wire [5:0]n98;
    
    wire n4828, n3784, n14, n8264, n10, n8260, n4133, n189, 
        n4268, n4270, n4272, n4274, n4278, n4095, n183, n4094, 
        n8282, n4993, n4266, n4264;
    
    FD1P3AX WR_DATA_i0_i0 (.D(tmp_WR_DATA[0]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[0])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i0.GSR = "DISABLED";
    FD1P3AX CMD_i0_i0 (.D(MEM_ADDR[6]), .SP(n200), .CK(RX_RdClock), .Q(CMD[0])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam CMD_i0_i0.GSR = "DISABLED";
    FD1S3DX WR_ENA_58 (.D(tmp_WR_ENA), .CK(RX_RdClock), .CD(POWERUP_RST), 
            .Q(WR_ENA)) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_ENA_58.GSR = "DISABLED";
    FD1S3BX STATE_FSM_i0 (.D(n4105), .CK(MAIN_CLK), .PD(POWERUP_RST), 
            .Q(n174[0]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam STATE_FSM_i0.GSR = "DISABLED";
    FD1P3DX FIFO_READ_PULSE_55 (.D(n4101), .SP(n7575), .CK(MAIN_CLK), 
            .CD(POWERUP_RST), .Q(\DEBUG_OUT[1] ));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam FIFO_READ_PULSE_55.GSR = "DISABLED";
    FD1P3AX tmp_WR_DATA_i0_i5 (.D(n4269), .SP(n8248), .CK(MAIN_CLK), .Q(tmp_WR_DATA[5])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i5.GSR = "DISABLED";
    FD1P3AX tmp_WR_DATA_i0_i4 (.D(n4271), .SP(n8248), .CK(MAIN_CLK), .Q(tmp_WR_DATA[4])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i4.GSR = "DISABLED";
    FD1P3AX tmp_WR_DATA_i0_i3 (.D(n4273), .SP(n8248), .CK(MAIN_CLK), .Q(tmp_WR_DATA[3])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i3.GSR = "DISABLED";
    FD1P3AX tmp_WR_DATA_i0_i2 (.D(n4275), .SP(n8248), .CK(MAIN_CLK), .Q(tmp_WR_DATA[2])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i2.GSR = "DISABLED";
    FD1P3AX tmp_WR_DATA_i0_i1 (.D(n4279), .SP(n8248), .CK(MAIN_CLK), .Q(tmp_WR_DATA[1])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i1.GSR = "DISABLED";
    FD1P3BX CMD_PENDING_57 (.D(n8480), .SP(n3786), .CK(MAIN_CLK), .PD(n200), 
            .Q(CMD_PENDING));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam CMD_PENDING_57.GSR = "DISABLED";
    FD1P3AX WR_ADDR_i0_i0 (.D(tmp_WR_ADDR[0]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_ADDR[0])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_ADDR_i0_i0.GSR = "DISABLED";
    LUT4 i2145_2_lut_rep_104 (.A(WR_ADDR[1]), .B(WR_ADDR[0]), .Z(n8267)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2145_2_lut_rep_104.init = 16'h8888;
    LUT4 i2363_3_lut (.A(n174[0]), .B(n174_c[3]), .C(n8285), .Z(n4105)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2363_3_lut.init = 16'hcece;
    LUT4 i2152_2_lut_rep_91_3_lut (.A(WR_ADDR[1]), .B(WR_ADDR[0]), .C(WR_ADDR[2]), 
         .Z(n8254)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2152_2_lut_rep_91_3_lut.init = 16'h8080;
    LUT4 i2157_2_lut_3_lut_4_lut (.A(WR_ADDR[1]), .B(WR_ADDR[0]), .C(WR_ADDR[3]), 
         .D(WR_ADDR[2]), .Z(n98[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;
    defparam i2157_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i2150_2_lut_3_lut (.A(WR_ADDR[1]), .B(WR_ADDR[0]), .C(WR_ADDR[2]), 
         .Z(n98[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;
    defparam i2150_2_lut_3_lut.init = 16'h7878;
    FD1P3IX tmp_WR_ADDR__i0 (.D(n98[0]), .SP(n4828), .CD(n3784), .CK(MAIN_CLK), 
            .Q(tmp_WR_ADDR[0])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_ADDR__i0.GSR = "DISABLED";
    LUT4 i6173_2_lut (.A(n174_c[3]), .B(n14), .Z(n7575)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i6173_2_lut.init = 16'h1111;
    LUT4 i14_4_lut (.A(n8264), .B(n177), .C(\FIFOStatus[0] ), .D(n174_c[2]), 
         .Z(n14)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B (C+!(D)))+!A (((D)+!C)+!B))) */ ;
    defparam i14_4_lut.init = 16'h0ac0;
    LUT4 i4_4_lut (.A(WR_ADDR[0]), .B(WR_ADDR[5]), .C(WR_ADDR[4]), .D(WR_ADDR[2]), 
         .Z(n10)) /* synthesis lut_function=(A+!(B (C (D)))) */ ;
    defparam i4_4_lut.init = 16'hbfff;
    LUT4 i2143_2_lut (.A(WR_ADDR[1]), .B(WR_ADDR[0]), .Z(n98[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i2143_2_lut.init = 16'h6666;
    FD1P3IX tmp_WR_ADDR__i3 (.D(n98[3]), .SP(n4828), .CD(n3784), .CK(MAIN_CLK), 
            .Q(tmp_WR_ADDR[3])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_ADDR__i3.GSR = "DISABLED";
    FD1P3IX tmp_WR_ADDR__i2 (.D(n98[2]), .SP(n4828), .CD(n3784), .CK(MAIN_CLK), 
            .Q(tmp_WR_ADDR[2])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_ADDR__i2.GSR = "DISABLED";
    FD1P3IX tmp_WR_ADDR__i1 (.D(n98[1]), .SP(n4828), .CD(n3784), .CK(MAIN_CLK), 
            .Q(tmp_WR_ADDR[1])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_ADDR__i1.GSR = "DISABLED";
    LUT4 i6175_4_lut_4_lut (.A(n174_c[2]), .B(n174_c[3]), .C(n8260), .D(POWERUP_RST), 
         .Z(n4828)) /* synthesis lut_function=(!(A (D)+!A (B (D)+!B ((D)+!C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i6175_4_lut_4_lut.init = 16'h00fe;
    FD1P3AX WR_ADDR_i0_i5 (.D(tmp_WR_ADDR[5]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_ADDR[5])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_ADDR_i0_i5.GSR = "DISABLED";
    FD1P3AX WR_ADDR_i0_i4 (.D(tmp_WR_ADDR[4]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_ADDR[4])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_ADDR_i0_i4.GSR = "DISABLED";
    FD1P3AX WR_ADDR_i0_i3 (.D(tmp_WR_ADDR[3]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_ADDR[3])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_ADDR_i0_i3.GSR = "DISABLED";
    FD1P3AX WR_ADDR_i0_i2 (.D(tmp_WR_ADDR[2]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_ADDR[2])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_ADDR_i0_i2.GSR = "DISABLED";
    FD1P3AX WR_ADDR_i0_i1 (.D(tmp_WR_ADDR[1]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_ADDR[1])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_ADDR_i0_i1.GSR = "DISABLED";
    LUT4 i6139_2_lut_4_lut (.A(n174_c[2]), .B(n174_c[3]), .C(n8260), .D(POWERUP_RST), 
         .Z(n3784)) /* synthesis lut_function=(!(A ((D)+!B)+!A (B (D)+!B ((D)+!C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i6139_2_lut_4_lut.init = 16'h00dc;
    LUT4 i2390_4_lut_4_lut (.A(\FIFOStatus[0] ), .B(n8264), .C(n177), 
         .D(n174_c[2]), .Z(n4133)) /* synthesis lut_function=(!(A+!(B (C+(D))+!B (C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(186[10:58])
    defparam i2390_4_lut_4_lut.init = 16'h5450;
    LUT4 reduce_or_58_i1_4_lut_4_lut (.A(\FIFOStatus[0] ), .B(n8264), .C(n177), 
         .D(n174_c[2]), .Z(n189)) /* synthesis lut_function=(A (C+(D))+!A !(B+!(D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(186[10:58])
    defparam reduce_or_58_i1_4_lut_4_lut.init = 16'hbba0;
    LUT4 i2171_3_lut_4_lut (.A(WR_ADDR[3]), .B(n8254), .C(WR_ADDR[4]), 
         .D(WR_ADDR[5]), .Z(n98[5])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;
    defparam i2171_3_lut_4_lut.init = 16'h7f80;
    LUT4 i2521_3_lut (.A(n4268), .B(WR_ADDR[5]), .C(n174_c[3]), .Z(n4269)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2521_3_lut.init = 16'hcaca;
    LUT4 i2523_3_lut (.A(n4270), .B(WR_ADDR[4]), .C(n174_c[3]), .Z(n4271)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2523_3_lut.init = 16'hcaca;
    LUT4 i2525_3_lut (.A(n4272), .B(WR_ADDR[3]), .C(n174_c[3]), .Z(n4273)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2525_3_lut.init = 16'hcaca;
    LUT4 i2527_3_lut (.A(n4274), .B(WR_ADDR[2]), .C(n174_c[3]), .Z(n4275)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2527_3_lut.init = 16'hcaca;
    LUT4 i2531_3_lut (.A(n4278), .B(WR_ADDR[1]), .C(n174_c[3]), .Z(n4279)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2531_3_lut.init = 16'hcaca;
    FD1P3IX tmp_WR_ADDR__i4 (.D(n98[4]), .SP(n4828), .CD(n3784), .CK(MAIN_CLK), 
            .Q(tmp_WR_ADDR[4])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_ADDR__i4.GSR = "DISABLED";
    FD1P3AX tmp_WR_ENA_53 (.D(n8285), .SP(n4067), .CK(MAIN_CLK), .Q(tmp_WR_ENA));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_ENA_53.GSR = "DISABLED";
    FD1P3AX tmp_WR_DATA_i0_i0 (.D(n4095), .SP(n8248), .CK(MAIN_CLK), .Q(tmp_WR_DATA[0])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i0.GSR = "DISABLED";
    FD1S3DX STATE_FSM_i3 (.D(n189), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(n174_c[3]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam STATE_FSM_i3.GSR = "DISABLED";
    FD1S3DX STATE_FSM_i2 (.D(n4133), .CK(MAIN_CLK), .CD(POWERUP_RST), 
            .Q(n174_c[2]));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam STATE_FSM_i2.GSR = "DISABLED";
    FD1S3DX STATE_FSM_i1 (.D(n183), .CK(MAIN_CLK), .CD(POWERUP_RST), .Q(n177));   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam STATE_FSM_i1.GSR = "DISABLED";
    LUT4 i2353_3_lut (.A(n4094), .B(WR_ADDR[0]), .C(n174_c[3]), .Z(n4095)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2353_3_lut.init = 16'hcaca;
    LUT4 i79_2_lut_rep_119 (.A(n174_c[2]), .B(n174_c[3]), .Z(n8282)) /* synthesis lut_function=(A+(B)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i79_2_lut_rep_119.init = 16'heeee;
    LUT4 i3195_2_lut_4_lut_2_lut (.A(n174_c[3]), .B(POWERUP_RST), .Z(n4993)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i3195_2_lut_4_lut_2_lut.init = 16'h2222;
    LUT4 i4375_2_lut_3_lut (.A(n174_c[2]), .B(n174_c[3]), .C(n177), .Z(n4101)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i4375_2_lut_3_lut.init = 16'h1010;
    FD1P3AX CMD_i0_i1 (.D(MEM_ADDR[7]), .SP(n200), .CK(RX_RdClock), .Q(CMD[1])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam CMD_i0_i1.GSR = "DISABLED";
    FD1P3AX WR_DATA_i0_i7 (.D(tmp_WR_DATA[7]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[7])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i7.GSR = "DISABLED";
    FD1P3AX WR_DATA_i0_i6 (.D(tmp_WR_DATA[6]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[6])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i6.GSR = "DISABLED";
    FD1P3AX WR_DATA_i0_i5 (.D(tmp_WR_DATA[5]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[5])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i5.GSR = "DISABLED";
    LUT4 i2_3_lut_rep_122 (.A(CMD[0]), .B(CMD[1]), .C(CMD_PENDING), .Z(n8285)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2_3_lut_rep_122.init = 16'h8080;
    FD1P3AX WR_DATA_i0_i4 (.D(tmp_WR_DATA[4]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[4])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i4.GSR = "DISABLED";
    FD1P3AX WR_DATA_i0_i3 (.D(tmp_WR_DATA[3]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[3])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i3.GSR = "DISABLED";
    FD1P3AX WR_DATA_i0_i2 (.D(tmp_WR_DATA[2]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[2])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i2.GSR = "DISABLED";
    FD1P3AX WR_DATA_i0_i1 (.D(tmp_WR_DATA[1]), .SP(n8299), .CK(RX_RdClock), 
            .Q(WR_DATA[1])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(206[4] 217[11])
    defparam WR_DATA_i0_i1.GSR = "DISABLED";
    LUT4 i53_2_lut_4_lut (.A(CMD[0]), .B(CMD[1]), .C(CMD_PENDING), .D(n174[0]), 
         .Z(n183)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i53_2_lut_4_lut.init = 16'h8000;
    LUT4 i402_2_lut_rep_97_4_lut (.A(CMD[0]), .B(CMD[1]), .C(CMD_PENDING), 
         .D(n177), .Z(n8260)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;
    defparam i402_2_lut_rep_97_4_lut.init = 16'h0080;
    FD1P3IX tmp_WR_ADDR__i5 (.D(n98[5]), .SP(n4828), .CD(n3784), .CK(MAIN_CLK), 
            .Q(tmp_WR_ADDR[5])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_ADDR__i5.GSR = "DISABLED";
    FD1P3IX tmp_WR_DATA_i0_i6 (.D(n4266), .SP(n8248), .CD(n4993), .CK(MAIN_CLK), 
            .Q(tmp_WR_DATA[6])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i6.GSR = "DISABLED";
    FD1P3IX tmp_WR_DATA_i0_i7 (.D(n4264), .SP(n8248), .CD(n4993), .CK(MAIN_CLK), 
            .Q(tmp_WR_DATA[7])) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=59, LSE_LLINE=155, LSE_RLINE=155 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(157[4] 204[11])
    defparam tmp_WR_DATA_i0_i7.GSR = "DISABLED";
    LUT4 i2530_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[1]), 
         .Z(n4278)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2530_3_lut_4_lut.init = 16'hf202;
    LUT4 i2526_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[2]), 
         .Z(n4274)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2526_3_lut_4_lut.init = 16'hf202;
    LUT4 i2524_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[3]), 
         .Z(n4272)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2524_3_lut_4_lut.init = 16'hf202;
    LUT4 i2522_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[4]), 
         .Z(n4270)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2522_3_lut_4_lut.init = 16'hf202;
    LUT4 i2164_2_lut_3_lut_4_lut (.A(WR_ADDR[2]), .B(n8267), .C(WR_ADDR[4]), 
         .D(WR_ADDR[3]), .Z(n98[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;
    defparam i2164_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i2520_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[5]), 
         .Z(n4268)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2520_3_lut_4_lut.init = 16'hf202;
    LUT4 i2352_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[0]), 
         .Z(n4094)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2352_3_lut_4_lut.init = 16'hf202;
    LUT4 i5_3_lut_rep_101 (.A(WR_ADDR[3]), .B(n10), .C(WR_ADDR[1]), .Z(n8264)) /* synthesis lut_function=((B+!(C))+!A) */ ;
    defparam i5_3_lut_rep_101.init = 16'hdfdf;
    LUT4 i6135_3_lut_rep_85_4_lut (.A(n8285), .B(n177), .C(n8282), .D(POWERUP_RST), 
         .Z(n8248)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B (D))+!A ((D)+!C))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i6135_3_lut_rep_85_4_lut.init = 16'h00f2;
    LUT4 i2518_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[6]), 
         .Z(n4266)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2518_3_lut_4_lut.init = 16'hf202;
    LUT4 i2516_3_lut_4_lut (.A(n8285), .B(n177), .C(n174_c[2]), .D(TX_Q[7]), 
         .Z(n4264)) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(158[5] 202[14])
    defparam i2516_3_lut_4_lut.init = 16'hf202;
    LUT4 i2141_1_lut (.A(WR_ADDR[0]), .Z(n98[0])) /* synthesis lut_function=(!(A)) */ ;
    defparam i2141_1_lut.init = 16'h5555;
    ram_dp MEM (.WR_ADDR({WR_ADDR}), .\MEM_ADDR[5] (MEM_ADDR[5]), .\MEM_ADDR[4] (MEM_ADDR[4]), 
           .\MEM_ADDR[3] (MEM_ADDR[3]), .\MEM_ADDR[2] (MEM_ADDR[2]), .\MEM_ADDR[1] (MEM_ADDR[1]), 
           .\MEM_ADDR[0] (MEM_ADDR[0]), .WR_DATA({WR_DATA}), .WR_ENA(WR_ENA), 
           .MAIN_CLK(MAIN_CLK), .VCC_net(VCC_net), .POWERUP_RST(POWERUP_RST), 
           .TXData({TXData}), .GND_net(GND_net)) /* synthesis NGD_DRC_MASK=1 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(122[8:14])
    
endmodule
//
// Verilog Description of module ram_dp
//

module ram_dp (WR_ADDR, \MEM_ADDR[5] , \MEM_ADDR[4] , \MEM_ADDR[3] , 
            \MEM_ADDR[2] , \MEM_ADDR[1] , \MEM_ADDR[0] , WR_DATA, WR_ENA, 
            MAIN_CLK, VCC_net, POWERUP_RST, TXData, GND_net) /* synthesis NGD_DRC_MASK=1 */ ;
    input [5:0]WR_ADDR;
    input \MEM_ADDR[5] ;
    input \MEM_ADDR[4] ;
    input \MEM_ADDR[3] ;
    input \MEM_ADDR[2] ;
    input \MEM_ADDR[1] ;
    input \MEM_ADDR[0] ;
    input [7:0]WR_DATA;
    input WR_ENA;
    input MAIN_CLK;
    input VCC_net;
    input POWERUP_RST;
    output [7:0]TXData;
    input GND_net;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    
    DP8KC ram_dp_0_0_0 (.DIA0(WR_DATA[0]), .DIA1(WR_DATA[1]), .DIA2(WR_DATA[2]), 
          .DIA3(WR_DATA[3]), .DIA4(WR_DATA[4]), .DIA5(WR_DATA[5]), .DIA6(WR_DATA[6]), 
          .DIA7(WR_DATA[7]), .DIA8(GND_net), .ADA0(VCC_net), .ADA1(GND_net), 
          .ADA2(GND_net), .ADA3(WR_ADDR[0]), .ADA4(WR_ADDR[1]), .ADA5(WR_ADDR[2]), 
          .ADA6(WR_ADDR[3]), .ADA7(WR_ADDR[4]), .ADA8(WR_ADDR[5]), .ADA9(GND_net), 
          .ADA10(GND_net), .ADA11(GND_net), .ADA12(GND_net), .CEA(VCC_net), 
          .OCEA(VCC_net), .CLKA(MAIN_CLK), .WEA(WR_ENA), .CSA0(GND_net), 
          .CSA1(GND_net), .CSA2(GND_net), .RSTA(POWERUP_RST), .DIB0(GND_net), 
          .DIB1(GND_net), .DIB2(GND_net), .DIB3(GND_net), .DIB4(GND_net), 
          .DIB5(GND_net), .DIB6(GND_net), .DIB7(GND_net), .DIB8(GND_net), 
          .ADB0(GND_net), .ADB1(GND_net), .ADB2(GND_net), .ADB3(\MEM_ADDR[0] ), 
          .ADB4(\MEM_ADDR[1] ), .ADB5(\MEM_ADDR[2] ), .ADB6(\MEM_ADDR[3] ), 
          .ADB7(\MEM_ADDR[4] ), .ADB8(\MEM_ADDR[5] ), .ADB9(GND_net), 
          .ADB10(GND_net), .ADB11(GND_net), .ADB12(GND_net), .CEB(VCC_net), 
          .OCEB(VCC_net), .CLKB(MAIN_CLK), .WEB(GND_net), .CSB0(GND_net), 
          .CSB1(GND_net), .CSB2(GND_net), .RSTB(POWERUP_RST), .DOB0(TXData[0]), 
          .DOB1(TXData[1]), .DOB2(TXData[2]), .DOB3(TXData[3]), .DOB4(TXData[4]), 
          .DOB5(TXData[5]), .DOB6(TXData[6]), .DOB7(TXData[7])) /* synthesis MEM_LPC_FILE="ram_dp.lpc", MEM_INIT_FILE="INIT_ALL_1s", syn_instantiated=1, LSE_LINE_FILE_ID=31, LSE_LCOL=8, LSE_RCOL=14, LSE_LLINE=122, LSE_RLINE=122 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_prefetch_if2.vhd(122[8:14])
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
    
endmodule
//
// Verilog Description of module fifo_dc
//

module fifo_dc (TX_Data, MAIN_CLK, RX_RdClock, TX_WrEn, \DEBUG_OUT[1] , 
            POWERUP_RST, GND_net, TX_Q, \FIFOStatus[0] , \FIFOStatus[3] , 
            \FIFOStatus[1] , \FIFOStatus[2] , VCC_net) /* synthesis NGD_DRC_MASK=1 */ ;
    input [7:0]TX_Data;
    input MAIN_CLK;
    input RX_RdClock;
    input TX_WrEn;
    input \DEBUG_OUT[1] ;
    input POWERUP_RST;
    input GND_net;
    output [7:0]TX_Q;
    output \FIFOStatus[0] ;
    output \FIFOStatus[3] ;
    output \FIFOStatus[1] ;
    output \FIFOStatus[2] ;
    input VCC_net;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    
    FIFO8KB fifo_dc_0_0 (.DI0(TX_Data[0]), .DI1(TX_Data[1]), .DI2(TX_Data[2]), 
            .DI3(TX_Data[3]), .DI4(TX_Data[4]), .DI5(TX_Data[5]), .DI6(TX_Data[6]), 
            .DI7(TX_Data[7]), .DI8(GND_net), .DI9(GND_net), .DI10(GND_net), 
            .DI11(GND_net), .DI12(GND_net), .DI13(GND_net), .DI14(GND_net), 
            .DI15(GND_net), .DI16(GND_net), .DI17(GND_net), .FULLI(\FIFOStatus[3] ), 
            .EMPTYI(\FIFOStatus[0] ), .CSW1(VCC_net), .CSW0(VCC_net), 
            .CSR1(VCC_net), .CSR0(VCC_net), .WE(TX_WrEn), .RE(\DEBUG_OUT[1] ), 
            .ORE(\DEBUG_OUT[1] ), .CLKW(MAIN_CLK), .CLKR(RX_RdClock), 
            .RST(POWERUP_RST), .RPRST(GND_net), .DO9(TX_Q[0]), .DO10(TX_Q[1]), 
            .DO11(TX_Q[2]), .DO12(TX_Q[3]), .DO13(TX_Q[4]), .DO14(TX_Q[5]), 
            .DO15(TX_Q[6]), .DO16(TX_Q[7]), .EF(\FIFOStatus[0] ), .AEF(\FIFOStatus[1] ), 
            .AFF(\FIFOStatus[2] ), .FF(\FIFOStatus[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=16, LSE_LLINE=147, LSE_RLINE=147 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(147[9:16])
    defparam fifo_dc_0_0.DATA_WIDTH_W = 18;
    defparam fifo_dc_0_0.DATA_WIDTH_R = 18;
    defparam fifo_dc_0_0.REGMODE = "NOREG";
    defparam fifo_dc_0_0.RESETMODE = "ASYNC";
    defparam fifo_dc_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam fifo_dc_0_0.CSDECODE_W = "0b11";
    defparam fifo_dc_0_0.CSDECODE_R = "0b11";
    defparam fifo_dc_0_0.AEPOINTER = "0b00000100000000";
    defparam fifo_dc_0_0.AEPOINTER1 = "0b00000100010000";
    defparam fifo_dc_0_0.AFPOINTER = "0b00111100000000";
    defparam fifo_dc_0_0.AFPOINTER1 = "0b00111011110000";
    defparam fifo_dc_0_0.FULLPOINTER = "0b01000000000000";
    defparam fifo_dc_0_0.FULLPOINTER1 = "0b00111111110000";
    defparam fifo_dc_0_0.GSR = "DISABLED";
    
endmodule
//
// Verilog Description of module fifo_dc_U0
//

module fifo_dc_U0 (RXData, MAIN_CLK, RX_RdClock, RX_WrEn, RX_RdEn, 
            POWERUP_RST, GND_net, RX_Q, \FIFOStatus[4] , \FIFOStatus[7] , 
            \FIFOStatus[5] , \FIFOStatus[6] , VCC_net) /* synthesis NGD_DRC_MASK=1 */ ;
    input [7:0]RXData;
    input MAIN_CLK;
    input RX_RdClock;
    input RX_WrEn;
    input RX_RdEn;
    input POWERUP_RST;
    input GND_net;
    output [7:0]RX_Q;
    output \FIFOStatus[4] ;
    output \FIFOStatus[7] ;
    output \FIFOStatus[5] ;
    output \FIFOStatus[6] ;
    input VCC_net;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    
    FIFO8KB fifo_dc_0_0 (.DI0(RXData[0]), .DI1(RXData[1]), .DI2(RXData[2]), 
            .DI3(RXData[3]), .DI4(RXData[4]), .DI5(RXData[5]), .DI6(RXData[6]), 
            .DI7(RXData[7]), .DI8(GND_net), .DI9(GND_net), .DI10(GND_net), 
            .DI11(GND_net), .DI12(GND_net), .DI13(GND_net), .DI14(GND_net), 
            .DI15(GND_net), .DI16(GND_net), .DI17(GND_net), .FULLI(\FIFOStatus[7] ), 
            .EMPTYI(\FIFOStatus[4] ), .CSW1(VCC_net), .CSW0(VCC_net), 
            .CSR1(VCC_net), .CSR0(VCC_net), .WE(RX_WrEn), .RE(RX_RdEn), 
            .ORE(RX_RdEn), .CLKW(MAIN_CLK), .CLKR(RX_RdClock), .RST(POWERUP_RST), 
            .RPRST(GND_net), .DO9(RX_Q[0]), .DO10(RX_Q[1]), .DO11(RX_Q[2]), 
            .DO12(RX_Q[3]), .DO13(RX_Q[4]), .DO14(RX_Q[5]), .DO15(RX_Q[6]), 
            .DO16(RX_Q[7]), .EF(\FIFOStatus[4] ), .AEF(\FIFOStatus[5] ), 
            .AFF(\FIFOStatus[6] ), .FF(\FIFOStatus[7] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=26, LSE_LCOL=9, LSE_RCOL=16, LSE_LLINE=140, LSE_RLINE=140 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/fifo_ctrl.vhd(140[9:16])
    defparam fifo_dc_0_0.DATA_WIDTH_W = 18;
    defparam fifo_dc_0_0.DATA_WIDTH_R = 18;
    defparam fifo_dc_0_0.REGMODE = "NOREG";
    defparam fifo_dc_0_0.RESETMODE = "ASYNC";
    defparam fifo_dc_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam fifo_dc_0_0.CSDECODE_W = "0b11";
    defparam fifo_dc_0_0.CSDECODE_R = "0b11";
    defparam fifo_dc_0_0.AEPOINTER = "0b00000100000000";
    defparam fifo_dc_0_0.AEPOINTER1 = "0b00000100010000";
    defparam fifo_dc_0_0.AFPOINTER = "0b00111100000000";
    defparam fifo_dc_0_0.AFPOINTER1 = "0b00111011110000";
    defparam fifo_dc_0_0.FULLPOINTER = "0b01000000000000";
    defparam fifo_dc_0_0.FULLPOINTER1 = "0b00111111110000";
    defparam fifo_dc_0_0.GSR = "DISABLED";
    
endmodule
//
// Verilog Description of module mono_U1
//

module mono_U1 (RX_RdClock, PARALLEL_RDN_c, MAIN_CLK, n8481, RXFN_INHIBIT, 
            \FIFOStatus[4] , n7377);
    input RX_RdClock;
    input PARALLEL_RDN_c;
    input MAIN_CLK;
    input n8481;
    input RXFN_INHIBIT;
    input \FIFOStatus[4] ;
    output n7377;
    
    wire MAIN_CLK /* synthesis SET_AS_NETWORK=MAIN_CLK */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/main_1300e.vhd(165[9:17])
    wire n8481 /* synthesis nomerge= */ ;
    
    wire delayed_inp;
    wire [3:0]counter;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(62[9:16])
    
    wire n38;
    wire [3:0]n1;
    wire [3:0]n22;
    
    wire n8283;
    
    FD1S3AX delayed_inp_27 (.D(PARALLEL_RDN_c), .CK(RX_RdClock), .Q(delayed_inp)) /* synthesis LSE_LINE_FILE_ID=26, LSE_LCOL=12, LSE_RCOL=23, LSE_LLINE=135, LSE_RLINE=135 */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(80[3] 85[10])
    defparam delayed_inp_27.GSR = "DISABLED";
    LUT4 i2_3_lut (.A(counter[3]), .B(delayed_inp), .C(PARALLEL_RDN_c), 
         .Z(n38)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(68[7:72])
    defparam i2_3_lut.init = 16'h2020;
    LUT4 i5465_1_lut (.A(n1[0]), .Z(n22[0])) /* synthesis lut_function=(!(A)) */ ;
    defparam i5465_1_lut.init = 16'h5555;
    FD1P3DX counter_2063__i0 (.D(n22[0]), .SP(n8283), .CK(MAIN_CLK), .CD(n38), 
            .Q(n1[0]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam counter_2063__i0.GSR = "DISABLED";
    LUT4 i5481_3_lut_4_lut (.A(n1[1]), .B(n1[0]), .C(n1[2]), .D(counter[3]), 
         .Z(n22[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;
    defparam i5481_3_lut_4_lut.init = 16'h7f80;
    LUT4 i5474_2_lut_3_lut (.A(n1[1]), .B(n1[0]), .C(n1[2]), .Z(n22[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;
    defparam i5474_2_lut_3_lut.init = 16'h7878;
    FD1P3DX counter_2063__i3 (.D(n8481), .SP(n22[3]), .CK(MAIN_CLK), .CD(n38), 
            .Q(counter[3]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam counter_2063__i3.GSR = "DISABLED";
    FD1P3DX counter_2063__i2 (.D(n22[2]), .SP(n8283), .CK(MAIN_CLK), .CD(n38), 
            .Q(n1[2]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam counter_2063__i2.GSR = "DISABLED";
    FD1P3DX counter_2063__i1 (.D(n22[1]), .SP(n8283), .CK(MAIN_CLK), .CD(n38), 
            .Q(n1[1]));   // E:/lscc/diamond/3.4_x64/ispfpga/vhdl_packages/syn_unsi.vhd(118[20:31])
    defparam counter_2063__i1.GSR = "DISABLED";
    LUT4 i5467_2_lut (.A(n1[1]), .B(n1[0]), .Z(n22[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i5467_2_lut.init = 16'h6666;
    LUT4 i24_1_lut_rep_120 (.A(counter[3]), .Z(n8283)) /* synthesis lut_function=(!(A)) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(88[7:28])
    defparam i24_1_lut_rep_120.init = 16'h5555;
    LUT4 i2_3_lut_3_lut (.A(counter[3]), .B(RXFN_INHIBIT), .C(\FIFOStatus[4] ), 
         .Z(n7377)) /* synthesis lut_function=((B+(C))+!A) */ ;   // e:/projekte/hardware/lattice/ffss3/xo345/source/monoflop.vhd(88[7:28])
    defparam i2_3_lut_3_lut.init = 16'hfdfd;
    
endmodule
