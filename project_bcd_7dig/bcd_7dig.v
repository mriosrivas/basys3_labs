`timescale 1ns / 1ps

module bcdto7segmentclocked(
    input [3:0] A, B, C, D,
    input reset,
    input clk,
    output [3:0] anode,
    output [6:0] seg 
    );

wire [3:0] x;
wire [3:0] an;
wire [1:0] sel;
wire clk_div;
bcdto7segment_dataflow bcdto7segment(.x(x), .an(an), .anode(anode), .seg(seg));
mux16to4 mux16to4(.A(A),.B(B),.C(C), .D(D), .sel(sel), .S(x));
demux4to1 demux4to1(.sel(sel), .A(an[0]), .B(an[1]), .C(an[2]), .D(an[3]));
counter counter(.reset(reset), .clk(clk_div), .out(sel));
ClkDivider ClkDivider(.clk(clk),.rst(reset),.clk_div(clk_div));

endmodule

module bcdto7segment_dataflow(
    input [3:0] x,
    input [3:0] an,
    output [3:0] anode,
    output reg [6:0] seg
    );
 //reg [6:0] seg;
 
 assign anode = an;
 
 always @ (x or an) 
    case (x) 
      0 : seg = 7'b0000001; 
      1 : seg = 7'b1001111; 
      2 : seg = 7'b0010010; 
      3 : seg = 7'b0000110; 
      4 : seg = 7'b1001100; 
      5 : seg = 7'b0100100;
      6 : seg = 7'b0100000;
      7 : seg = 7'b0001111;
      8 : seg = 7'b0000000;
      9 : seg = 7'b0000100;
      default : seg = 7'b0000000;
    endcase    
endmodule

module mux16to4(
    input [3:0] A, 
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [1:0] sel,
    output reg [3:0] S
   );
   
always @ (A, B, C, D, sel)
    case (sel)
    0 : S = A;
    1 : S = B;
    2 : S = C;
    3 : S = D;
    default : S = 0;
    endcase

endmodule

module demux4to1(
    input [1:0] sel,
    output reg A, 
    output reg B,
    output reg C,
    output reg D
    );
always @ (sel)
    case (sel)
    0 : {D, C, B, A} = ~(4'b0001);
    1 : {D, C, B, A} = ~(4'b0010);
    2 : {D, C, B, A} = ~(4'b0100);
    3 : {D, C, B, A} = ~(4'b1000);
    default :  {D, C, B, A} = ~(4'b0000);
    endcase    
endmodule

module counter(
    input reset,
    input clk,
    output reg [1:0] out
    );

    //reg [1:0] out;

    always @(posedge clk, posedge reset)
        if (reset) begin
        out <= 2'b00 ;
        end 
        else begin
        out <= out + 1;
        end
endmodule 


module ClkDivider (
    input clk,
    input rst,
    output reg clk_div
    );
     
localparam constantNumber = 50000;//f=1kHz  f=100MHz/(2*constantNumber)
//localparam constantNumber = 25000000;//f=2Hz  f=100MHz/(2*constantNumber)

reg [31:0] count;
 
always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        count <= 32'b0;
    else if (count == constantNumber - 1)
        count <= 32'b0;
    else
        count <= count + 1;
end

always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        clk_div <= 1'b0;
    else if (count == constantNumber - 1)
        clk_div <= ~clk_div;
    else
        clk_div <= clk_div;
end 
endmodule
