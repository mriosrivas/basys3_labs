`timescale 1ns / 1ps

module vga1280x1024(
	input wire dclk,			//pixel clock: 108MHz
	input wire clr,			//asynchronous reset
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [3:0] red,	//red vga output
	output reg [3:0] green, //green vga output
	output reg [3:0] blue	//blue vga output
	);

//// video structure constants for a 640x480 display
//parameter hpixels = 1800;// horizontal pixels per line
//parameter vlines = 795; // vertical lines per frame
//parameter hpulse = 144; 	// hsync pulse length
//parameter vpulse = 3; 	// vsync pulse length
//parameter hbp = 360; 	// end of horizontal back porch
//parameter hfp = 1728; 	// beginning of horizontal front porch
//parameter vbp = 23; 		// end of vertical back porch
//parameter vfp = 790; 	// beginning of vertical front porch
//// active horizontal video is therefore: 784 - 144 = 640
//// active vertical video is therefore: 511 - 31 = 480

// video structure constants
parameter hpixels = 1688;// horizontal pixels per line
parameter vlines = 1066; // vertical lines per frame
parameter hpulse = 112; 	// hsync pulse length
parameter vpulse = 3; 	// vsync pulse length
parameter hbp = 360; 	// end of horizontal back porch
parameter hfp = 1640; 	// beginning of horizontal front porch
parameter vbp = 35; 		// end of vertical back porch
parameter vfp = 1059; 	// beginning of vertical front porch
// active horizontal video is therefore: 1640 - 360 = 1280
// active vertical video is therefore: 1059 - 35 = 1024

reg [10:0] hc;
reg [10:0] vc;

always @(posedge dclk or posedge clr)
begin
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

always @(*)
begin
	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
		// display white bar
		if (hc >= hbp && hc < (hbp+160))
		begin
			red = 4'b1111;
			green = 4'b1111;
			blue = 4'b1111;
		end
		// display yellow bar
		else if (hc >= (hbp+160) && hc < (hbp+320))
		begin
			red = 4'b1111;
			green = 4'b1111;
			blue = 4'b0000;
		end
		// display cyan bar
		else if (hc >= (hbp+320) && hc < (hbp+480))
		begin
			red = 4'b0000;
			green = 4'b1111;
			blue = 4'b1111;
		end
		// display green bar
		else if (hc >= (hbp+480) && hc < (hbp+640))
		begin
			red = 4'b0000;
			green = 4'b1111;
			blue = 4'b0000;
		end
		// display magenta bar
		else if (hc >= (hbp+640) && hc < (hbp+800))
		begin
			red = 4'b1111;
			green = 4'b0000;
			blue = 4'b1111;
		end
		// display red bar
		else if (hc >= (hbp+800) && hc < (hbp+960))
		begin
			red = 4'b1111;
			green = 4'b0000;
			blue = 4'b0000;
		end
		// display blue bar
		else if (hc >= (hbp+960) && hc < (hbp+1120))
		begin
			red = 4'b0000;
			green = 4'b0000;
			blue = 4'b1111;
		end
		// display black bar
		else if (hc >= (hbp+1120) && hc < (hbp+1280))
		begin
			red = 4'b0000;
			green = 4'b0000;
			blue = 4'b0000;
		end
		// we're outside active horizontal range so display black
		else
		begin
			red = 0;
			green = 0;
			blue = 0;
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule
