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
//  File:              ext_if.v
//  Title:             ext_if
//  Description:       External interface module of this reference design for XO2 architecture
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author   | Mod. Date  | Changes Made:
// V1.0 | H.C.     | 2012-03-09 | Initial Release
//
// --------------------------------------------------------------------

`timescale 1 ns/ 1 ps

module ext_if #(parameter GPI_PORT_NUM = 1,         // GPI port number             
                parameter GPI_DATA_WIDTH = 8,       // GPI data width              
                parameter GPO_PORT_NUM = 1,         // GPO port number             
                parameter GPO_DATA_WIDTH = 8,       // GPO data width              
                parameter MEM_ADDR_WIDTH = 8,       // Memory addrss width         
                parameter IRQ_NUM = 4,              // Interrupt request number    
                parameter INTQ_OPENDRAIN = "ON"     // INTQ opendrain setting (ON/OFF)
                )                                                
   (
    input  wire                                   clk,         // System clock    
    input  wire                                   rst_n,       // System reset    
    input  wire                                   en_port,     // Genaral purpose enable port 
    input  wire                                   gpi_ld,      // GPI latch                        
    input  wire                                   gpio_wr,     // GPIO write (high) and read (low) 
    input  wire [7:0]                             gpio_addr,   // GPIO port address                             
    input  wire [GPO_DATA_WIDTH-1:0]              gpio_dout,   // GPIO port output data bus 
    output reg  [GPI_DATA_WIDTH-1:0]              gpio_din,    // GPIO port input data bus  
    input  wire                                   mem_wr_i,    // Internal memory write (high) and read (low)              
    input  wire [MEM_ADDR_WIDTH-1:0]              mem_addr_i,  // Internal memory address        
    input  wire [7:0]                             mem_wdata_i, // Internal memory write data bus
    output wire [7:0]                             mem_rdata_i, // Internal memory read data bus 
    input  wire [IRQ_NUM-1:0]                     irq_en,      // IRQ enable 
    input  wire [IRQ_NUM-1:0]                     irq_clr,     // IRQ clear 
    output reg  [IRQ_NUM-1:0]                     irq_status,  // IRQ status   
    input  wire [GPI_PORT_NUM*GPI_DATA_WIDTH-1:0] gpi,         // GPI ports
    output wire [GPO_PORT_NUM*GPO_DATA_WIDTH-1:0] gpo,         // GPO ports
    output wire                                   enable,      // Genaral purpose enable  
    input  wire [IRQ_NUM-1:0]                     irq,         // Interrupt requests (rising edge sensitive) 
    output wire                                   intq,        // External interrupt (active low)            
    output wire                                   mem_clk,     // Memory clock (copy of CLK)
    output wire                                   mem_wr,      // Memory write enable       
    output wire [MEM_ADDR_WIDTH-1:0]              mem_addr,    // Memory address            
    output wire [7:0]                             mem_wdata,   // Memory write data         
    input  wire [7:0]                             mem_rdata    // Memory read data          
    );
 
   // 256 possible addresses -	   
   parameter GPI_FULL_WIDTH = (256 * GPI_DATA_WIDTH) ;
   parameter GPO_FULL_WIDTH = (256 * GPO_DATA_WIDTH) ;    
   
   reg  [GPI_PORT_NUM*GPI_DATA_WIDTH-1:0] gpi_reg;        // GPI registers
   wire [GPI_FULL_WIDTH-1:0]              gpi_reg_tmp;    // Internal full GPI data
   reg  [GPO_FULL_WIDTH-1:0]              gpo_reg_tmp;    // Internal full GPO data
   reg                                    gpi_ld_buf;     // A buffer for gpi_ld
   wire [IRQ_NUM-1:0]                     irq_status_clr; // IRQ status clear
   
   integer j;
   integer k;
   
  
   // intq is asserted low when any IRQ Status Register bit is set. 
   // And the INTQ_OPENDRAIN parameter defines INTQ's opendrain setting. 
   assign intq = (|irq_status) ? 1'b0 : (INTQ_OPENDRAIN == "ON" ? 1'bz : 1'b1);
   
 
   // When IRQ is enabled, a rising edge of an IRQ input will set the corresponding bit in the IRQ Status register.
   genvar i;
   
   generate
   for (i=0; i < IRQ_NUM; i=i+1)
   begin 
       assign irq_status_clr[i] = irq_clr[i] | ~rst_n;
       
       always @(posedge irq[i] or posedge irq_status_clr[i])
	   begin
          if (irq_status_clr[i])
             irq_status[i] <= 1'b0;
          else
             if (irq_en[i])
		     begin
                irq_status[i] <= 1'b1;
			 end
       end				
   end
   endgenerate 
   
   // Buffer gpi_ld
   always @(posedge clk or negedge rst_n)
       if (!rst_n)
          gpi_ld_buf <= 1'b0;
       else
          gpi_ld_buf <= gpi_ld;
   
   // Latch GPI
   always @(posedge clk or negedge rst_n)
       if (!rst_n)
          gpi_reg <= 'b0;
       else if (gpi_ld && !gpi_ld_buf)
          gpi_reg <= gpi;   
   
   // Assign internal GPI data with GPI ports when GPI Latch state is '0', or with GPI latched register when GPI Latch state is '1'
   // Undefined GPI ports are assigned with all '1's.       
   assign gpi_reg_tmp = gpi_ld ? {{(GPI_FULL_WIDTH-GPI_PORT_NUM*GPI_DATA_WIDTH){1'b1}}, gpi_reg} : 
                                 {{(GPI_FULL_WIDTH-GPI_PORT_NUM*GPI_DATA_WIDTH){1'b1}}, gpi};       
   
   // Assign GPIO input data with the corresponding GPI data
   always @(posedge clk or negedge rst_n) 
      if (!rst_n)
         gpio_din <= 'b0;
      else      
         for (j=0; j<GPI_DATA_WIDTH;j=j+1)
            gpio_din[j] <= gpi_reg_tmp[gpio_addr*GPI_DATA_WIDTH + j];
   
   // Write internal GPO data  
/*   
   always @(posedge clk or negedge rst_n)
      if (!rst_n)
         gpo_reg_tmp <= 'b0;
      else
         if (gpio_wr)
         begin
			// doesn't work when synthesized ( behaves like gpo_reg_tmp[gpio_addr*GPO_DATA_WIDTH + k] <= gpio_dout[7]; )
			for (k=0; k < GPO_DATA_WIDTH; k=k+1)
               gpo_reg_tmp[gpio_addr*GPO_DATA_WIDTH + k] <= gpio_dout[k]; 
		
			// simplified test statement without above structue (improved version below)
			// gpo_reg_tmp[GPO_DATA_WIDTH-1 : 0] <= gpio_dout[GPO_DATA_WIDTH-1:0];		
		 end

*/
	// Write internal GPO data (new version)
	genvar p;
	genvar n;
	generate 
	   for (p=0; p < GPO_PORT_NUM; p=p+1) 
		 for (n=0; n < GPO_DATA_WIDTH; n=n+1) 
		 begin  
		    always @(posedge clk or negedge rst_n)
		  	  if (!rst_n)
			  	  gpo_reg_tmp[p*GPO_DATA_WIDTH + n]  <= 'b0;
			  else
				  if(gpio_addr == p) // or: if((gpio_addr[7:3] == 'b0) && (gpio_addr[2:0] == p)) ?
				     gpo_reg_tmp[p*GPO_DATA_WIDTH + n]  <= gpio_dout[n];
		 end
	endgenerate

	 
   // Assign GPO output ports    
   assign gpo = gpo_reg_tmp[GPO_PORT_NUM*GPO_DATA_WIDTH-1:0];   
   
   assign enable = en_port;       
   
   assign mem_clk = clk;
   assign mem_wr = mem_wr_i;
   assign mem_addr = mem_addr_i;
   assign mem_wdata = mem_wdata_i;
   assign mem_rdata_i = mem_rdata;
   
endmodule      