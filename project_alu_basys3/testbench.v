module data_tb;
wire [15:0] tb_x, tb_y;
wire [5:0] tb_opcode;
reg [15:0] tb_data;
reg tb_clk;
reg [2:0] tb_load;

data my_data(
    .data(tb_data),
    //.push(tb_clk),
    .load(tb_load),
    .x(tb_x), .y(tb_y),
    .opcode(tb_opcode)
    );

always
    begin
    #2 tb_clk = ~tb_clk;
    end
    
initial
begin
$monitor(tb_x, tb_y, tb_opcode, tb_clk);

tb_clk = 0;
#5

tb_data = 16'b0;
tb_load = 3'b0;

#5
tb_load = 3'b001;

#5
tb_data = 16'b1010101010101010;

#5
tb_load = 3'b010;

#5
tb_data = 16'b1111111100110011;

#5
tb_load = 3'b100;

end
endmodule

module bcd_tb;
reg  [12:0] tb_number;
   wire [3:0] tb_thousands;
   wire [3:0] tb_hundreds;
   wire [3:0] tb_tens;
   wire [3:0] tb_ones;

bcd my_bcd(
        .number(tb_number), 
        .thousands(tb_thousands), 
        .hundreds(tb_hundreds), 
        .tens(tb_tens), 
        .ones(tb_ones)
        );
        
        
initial
begin
  $monitor(tb_number, tb_thousands, tb_hundreds, tb_tens, tb_ones);

#5
tb_number = 13'b1111111111111;
#5
tb_number = 13'b1010101010101;
        
end
endmodule
