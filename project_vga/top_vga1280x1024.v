module top_vga(
    input clk,
    input rst,
    output hsync,
    output vsync,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue);

wire clkd;

vga1280x1024 vga1280x1024(
	.dclk(clkd),			//pixel clock: 108MHz
	.clr(rst),			//asynchronous reset
	.hsync(hsync),		//horizontal sync out
	.vsync(vsync),		//vertical sync out
	.red(red),	//red vga output
	.green(green), //green vga output
	.blue(blue)	//blue vga output
	);

clockdiv_wrapper clockdiv_wrapper(
    .clk(clk),
    .clkd(clkd)
    );
endmodule
