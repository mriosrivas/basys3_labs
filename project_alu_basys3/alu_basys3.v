`timescale 1ns / 1ps

module top_data_alu(
    input [15:0] data,
    //input push,
    input reset,
    input [2:0] load,
    output [15:0] alu_out
    //output zr,
    //output ng
    );

wire [5:0] opcode;    
wire [15:0] x, y;

data my_data(
        .data(data),
        //.push(push), //BTND
        .reset(reset),
        .load(load),
        .x(x), 
        .y(y),
        .opcode(opcode)
        );
        
ALU_case ALU(
            .c(opcode),
            .x(x),
            .y(y),
            .out(alu_out),
            .zr(zr),
            .ng(ng)
            );

endmodule

module data(
    input [15:0] data,
    //input push, //BTND
    input reset,
    input [2:0] load,
    output reg [15:0] x, y,
    output reg [5:0] opcode
    );
    
wire load_x, load_y, load_opcode;

//assign load_x = load[0];  //BTNL  
//assign load_y = load[1];  //BTNR
//assign load_opcode = load[2]; //BTNU
       
/*always @(*)
if (reset)
begin
    x <= 0;
    y <= 0;
    opcode <= 0;
end
else if (load_x)
    x <= data;
else if (load_y)
    y <= data;
else if (load_opcode)
    opcode <= data[5:0];
*/

always @(*)
if (reset)
    begin
    x = 0;
    y = 0;
    opcode = 0;
    end
else
    begin
        case (load)
        3'b001 : x = data;
        3'b010 : y = data;
        3'b100 : opcode = data[5:0];
        endcase
    end
       
endmodule


module ALU_case(
    input [1:6] c,
    input [15:0] x,
    input [15:0] y,
    output reg [15:0] out,
    output zr,
    output ng
    );
    
//Insert code here
     
endmodule
