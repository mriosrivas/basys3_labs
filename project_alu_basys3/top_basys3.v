`timescale 1ns / 1ps

module top(
    input [15:0] data,  
    input [2:0] load, //{opcode,y,x}  
    input clk,  
    input reset,  
    output [3:0] anode, 
    output [6:0] seg,  
    output [15:0] leds_out  
    );
    
wire [15:0] alu_out;
wire [15:0] display_out;

assign leds_out = alu_out;
assign display_out = alu_out;

top_data_alu alu(
    .data(data),
    //.push(push),
    .reset(reset),
    .load(load),
    .alu_out(alu_out)
    //.zr(zr),
    //.ng(ng)
    );

top_bcd bcd(
    .number(alu_out[12:0]),
    .reset(reset),
    .clk(clk),
    .anode(anode),
    .seg(seg)
    );
    
endmodule
