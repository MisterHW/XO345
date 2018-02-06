// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2010 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
// Permission:
//
//   Lattice Semiconductor grants permission to use this code for use
//   in synthesis for any Lattice programmable logic product.  Other
//   use of this code, including the selling or duplication of any
//   portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL or Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Lattice Semiconductor provides no warranty
//   regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Lattice Semiconductor Corporation
//                     5555 NE Moore Court
//                     Hillsboro, OR 97214
//                     U.S.A
//
//                     TEL: 1-800-Lattice (USA and Canada)
//                          503-268-8001 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
//
//  Project:           SPI slave with EFB
//  File:              spi_slave_top.v
//  Title:             spi_slave_top
//  Description:       Top level design file of SPI slave with EFB reference design
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author   | Mod. Date  | Changes Made:
// V1.0 | H.C.     | 2012-03-09 | Initial Release
//
// --------------------------------------------------------------------

`timescale 1ns/ 1ps

module spi_slave_top #(parameter GPI_PORT_NUM = 2,      // GPI port number 
                       parameter GPI_DATA_WIDTH = 8,    // GPI data width
                       parameter GPO_PORT_NUM = 1,      // GPO port number     
                       parameter GPO_DATA_WIDTH = 8,    // GPO data width  
                       parameter MEM_ADDR_WIDTH = 8,    // Memory addrss width
                       parameter IRQ_NUM = 4,           // Interrupt request number
                       parameter REVISION_ID = 8'h01,   // Revision ID
                       parameter MAX_MEM_BURST_NUM = 256, // Maximum memory burst number
                       parameter INTQ_OPENDRAIN = "ON"  // INTQ opendrain setting (ON/OFF)
                       )
   (
   input  wire                      CLK,       // System clock
   input  wire                      RST_N,     // System asynchronouse reset (active low)
                                               
   input  wire                      CCLK,      // Hard SPI serial clock
   input  wire                      SCSN,      // Hard SPI chip-select (active low)
   input  wire                      SI,        // Hard SPI serial input data
   output wire                      SO,        // Hard SPI serial output data
   
   // GPI/GPO ports can be defined manually based on the real case. And the parameters                                             
   // such as GPI_PORT_NUM/GPI_DATA_WIDTH/GPO_PORT_NUM/GPO_DATA_WIDTH should be set accordingly.
   input  wire [GPI_DATA_WIDTH-1:0] GPI_0,     // General purpose input port 0  
   input  wire [GPI_DATA_WIDTH-1:0] GPI_1,     // General purpose input port 1 
   //input  wire [GPI_DATA_WIDTH-1:0] GPI_2,     // General purpose input port 2 
   //input  wire [GPI_DATA_WIDTH-1:0] GPI_3,     // General purpose input port 3 
   output wire [GPO_DATA_WIDTH-1:0] GPO_0,     // General purpose output port 0 
   //output wire [GPO_DATA_WIDTH-1:0] GPO_1,     // General purpose output port 1 
   //output wire [GPO_DATA_WIDTH-1:0] GPO_2,     // General purpose output port 2 
   //output wire [GPO_DATA_WIDTH-1:0] GPO_3,     // General purpose output port 3 
   output wire                      Enable,    // Genaral purpose enable
   
   output wire                      MEM_CLK,   // Memory clock (copy of CLK)
   output wire                      MEM_WR,    // Memory write enable                     
   output wire [MEM_ADDR_WIDTH-1:0] MEM_ADDR,  // Memory address
   output wire [7:0]                MEM_WD,    // Memory write data
   input  wire [7:0]                MEM_RD,    // Memory read data
   
   input  wire [IRQ_NUM-1:0]        IRQ,       // Interrupt requests (rising edge sensitive)       
   output wire                      INTQ,       // External interrupt (active low)  
   output wire 						MEM_RD_FIRST, // [MOD] - toggles when address is loaded at beginning of a read sequence
   output wire 						MEM_RD_NEXT,  // [MOD] - toggles at subsequent address increments during read sequence
   output wire 						MEM_WR_ACTIVE // [MOD] - active around SPI-write-to-RX-FIFO transactions
   );
   
   
   wire                                   wb_clk_i;
   wire                                   wb_rst_i;
   wire                                   wb_cyc_i;
   wire                                   wb_stb_i;
   wire                                   wb_we_i;
   wire [7:0]                             wb_adr_i;
   wire [7:0]                             wb_dat_i;
   wire [7:0]                             wb_dat_o;
   wire                                   wb_ack_o; 
                                          
   wire [7:0]                             address;                       
   wire                                   wr_en;                               
   wire [7:0]                             wr_data;                       
   wire                                   rd_en;                               
   wire [7:0]                             rd_data;                       
   wire                                   wb_xfer_done;                           
   wire                                   wb_xfer_req;                            
   wire                                   spi_irq;                             
   wire                                   en_port;                             
   wire                                   gpi_ld;                              
   wire                                   gpio_wr;                             
   wire [7:0]                             gpio_addr;
   wire [GPO_DATA_WIDTH-1:0]              gpio_dout;      
   wire [GPI_DATA_WIDTH-1:0]              gpio_din;       
   wire                                   mem_wr_i;                              
   wire [MEM_ADDR_WIDTH-1:0]              mem_addr_i;       
   wire [7:0]                             mem_wdata_i;                      
   wire [7:0]                             mem_rdata_i;   
   wire [IRQ_NUM-1:0]                     irq_status;                       
   wire [IRQ_NUM-1:0]                     irq_en;            
   wire [IRQ_NUM-1:0]                     irq_clr;
       
   wire [GPI_PORT_NUM*GPI_DATA_WIDTH-1:0] gpi;
   wire [GPO_PORT_NUM*GPO_DATA_WIDTH-1:0] gpo;
   
   // Use a vector signal to define GPI ports or GPO ports
//    assign gpi = {GPI_3,GPI_2,GPI_1,GPI_0};
//   assign {GPO_3,GPO_2,GPO_1,GPO_0} = gpo;
   assign gpi = {GPI_0};
   assign {GPO_0} = gpo;


   // Use system clock/reset as the WISHBONE's clock/reset
   assign wb_clk_i = CLK;
   assign wb_rst_i = ~RST_N;

   // SPI slave EFB module instantiation 
   spi_slave_efb sspi_efb_inst (
             .wb_clk_i (wb_clk_i), 
             .wb_rst_i (wb_rst_i), 
             .wb_cyc_i (wb_cyc_i), 
             .wb_stb_i (wb_stb_i), 
             .wb_we_i  (wb_we_i ),  
             .wb_adr_i (wb_adr_i), 
             .wb_dat_i (wb_dat_i), 
             .wb_dat_o (wb_dat_o), 
             .wb_ack_o (wb_ack_o), 
             .spi_irq  (spi_irq ),
             .spi_clk  (CCLK ),  
             .spi_miso (SO), 
             .spi_mosi (SI), 
             .spi_scsn (SCSN)
             );
   
   // WISHBONE control module instantiation           
   wb_ctrl wb_ctrl_inst (
             .wb_clk_i  (wb_clk_i    ),
             .wb_rst_i  (wb_rst_i    ),
             .wb_cyc_i  (wb_cyc_i    ),
             .wb_stb_i  (wb_stb_i    ),
             .wb_we_i   (wb_we_i     ),
             .wb_adr_i  (wb_adr_i    ),
             .wb_dat_i  (wb_dat_i    ),
             .wb_dat_o  (wb_dat_o    ),
             .wb_ack_o  (wb_ack_o    ), 
             .address   (address     ), 
             .wr_en     (wr_en       ),
             .wr_data   (wr_data     ),
             .rd_en     (rd_en       ),    
             .rd_data   (rd_data     ),
             .xfer_done (wb_xfer_done),
             .xfer_req  (wb_xfer_req )
             );   
    
   // Main control module instantiation        
   main_ctrl #(
               .GPI_PORT_NUM         (GPI_PORT_NUM        ),
               .GPI_DATA_WIDTH       (GPI_DATA_WIDTH      ),  
               .GPO_PORT_NUM         (GPO_PORT_NUM        ), 
               .GPO_DATA_WIDTH       (GPO_DATA_WIDTH      ),
               .MEM_ADDR_WIDTH       (MEM_ADDR_WIDTH      ),  
               .IRQ_NUM              (IRQ_NUM             ),
               .REVISION_ID          (REVISION_ID         ),
               .MAX_MEM_BURST_NUM    (MAX_MEM_BURST_NUM   )
               )
   main_ctrl_inst (
                   .clk            (CLK          ),
                   .rst_n          (RST_N        ),
                   .spi_csn        (SCSN         ),
                   .address        (address      ), 
                   .wr_en          (wr_en        ),
                   .wr_data        (wr_data      ),
                   .rd_en          (rd_en        ),    
                   .rd_data        (rd_data      ),
                   .wb_xfer_done   (wb_xfer_done ),
                   .wb_xfer_req    (wb_xfer_req  ),
                   .en_port        (en_port      ),
                   .gpi_ld         (gpi_ld       ),
                   .gpio_wr        (gpio_wr      ),
                   .gpio_addr      (gpio_addr    ),
                   .gpio_dout      (gpio_dout    ),
                   .gpio_din       (gpio_din     ),
                   .mem_wr         (mem_wr_i     ),
                   .mem_addr       (mem_addr_i   ),
                   .mem_wdata      (mem_wdata_i  ),
                   .mem_rdata      (mem_rdata_i  ),
                   .irq_status     (irq_status   ),                   
                   .irq_en         (irq_en       ),
                   .irq_clr        (irq_clr      ),
				   .mem_rd_first   (MEM_RD_FIRST), // [MOD]
				   .mem_rd_next	   (MEM_RD_NEXT ), // [MOD]
				   .mem_wr_active  (MEM_WR_ACTIVE) // [MOD]	
                   );
     
   //External interface module instantiation                
   ext_if    #(
               .GPI_PORT_NUM         (GPI_PORT_NUM        ),
               .GPI_DATA_WIDTH       (GPI_DATA_WIDTH      ),  
               .GPO_PORT_NUM         (GPO_PORT_NUM        ), 
               .GPO_DATA_WIDTH       (GPO_DATA_WIDTH      ),
               .MEM_ADDR_WIDTH       (MEM_ADDR_WIDTH      ),  
               .IRQ_NUM              (IRQ_NUM             ),
               .INTQ_OPENDRAIN       (INTQ_OPENDRAIN      )
               )
   ext_if_inst (
                .clk              (CLK            ),
                .rst_n            (RST_N          ),
                .en_port          (en_port        ),
                .gpi_ld           (gpi_ld         ),
                .gpio_wr          (gpio_wr        ),
                .gpio_addr        (gpio_addr      ),
                .gpio_dout        (gpio_dout      ),
                .gpio_din         (gpio_din       ),
                .mem_wr_i         (mem_wr_i       ),
                .mem_addr_i       (mem_addr_i     ),
                .mem_wdata_i      (mem_wdata_i    ),
                .mem_rdata_i      (mem_rdata_i    ),
                .irq_en           (irq_en         ),
                .irq_clr          (irq_clr        ),
                .irq_status       (irq_status     ),
                .gpi              (gpi            ),
                .gpo              (gpo            ),
                .enable           (Enable         ),
                .irq              (IRQ            ),
                .intq             (INTQ           ),
                .mem_clk          (MEM_CLK        ),
                .mem_wr           (MEM_WR         ),
                .mem_addr         (MEM_ADDR       ),
                .mem_wdata        (MEM_WD         ),
                .mem_rdata        (MEM_RD         )
                );                          
endmodule                 