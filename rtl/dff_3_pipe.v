// +----------------------------------------------------------------------------
// Universidade Federal da Bahia
//------------------------------------------------------------------------------
// PROJECT: FPGA Median Filter
//------------------------------------------------------------------------------
// FILE NAME            : pixel_network.v
// AUTHOR               : João Carlos Bittencourt
// AUTHOR'S E-MAIL      : joaocarlos@ieee.org
// -----------------------------------------------------------------------------
// RELEASE HISTORY
// VERSION  DATE        AUTHOR        DESCRIPTION
// 1.0      2013-08-13  joao.nunes    initial version
// -----------------------------------------------------------------------------
// KEYWORDS: dff, flip-flop, register bank
// -----------------------------------------------------------------------------
// PURPOSE: Group median pipeline registers.
// -----------------------------------------------------------------------------
module dff_3_pipe
#(
    parameter DATA_WIDTH = 8
)(
    input clk,
    input rst_n,
    input [DATA_WIDTH-1:0] d0,
    input [DATA_WIDTH-1:0] d1,
    input [DATA_WIDTH-1:0] d2,

    output reg [DATA_WIDTH-1:0] q0,
    output reg [DATA_WIDTH-1:0] q1,
    output reg [DATA_WIDTH-1:0] q2
);

always @(posedge clk or negedge rst_n)
begin : register_bank_3u
    if(~rst_n) begin
        q0 <= {DATA_WIDTH{1'b0}};
        q1 <= {DATA_WIDTH{1'b0}};
        q2 <= {DATA_WIDTH{1'b0}};
    end else begin
        q0 <= d0;
        q1 <= d1;
        q2 <= d2;
    end
end

endmodule