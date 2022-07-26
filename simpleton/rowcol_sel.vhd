library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_utils.all;

entity rowcol_sel is
	port(
		hpos, vpos : in integer;
		row, col : buffer integer
		);
end rowcol_sel;

architecture rtl of rowcol_sel is
begin
	row <= 0  when (vpos>=(VSTART+0)   and vpos<(VSTART+36)) else 
			 1  when (vpos>=(VSTART+36)  and vpos<(VSTART+72)) else 
			 2  when (vpos>=(VSTART+72)  and vpos<(VSTART+108)) else 
			 3  when (vpos>=(VSTART+108) and vpos<(VSTART+144)) else 
			 4  when (vpos>=(VSTART+144) and vpos<(VSTART+180)) else 
			 5  when (vpos>=(VSTART+180) and vpos<(VSTART+216)) else 
			 6  when (vpos>=(VSTART+216) and vpos<(VSTART+252)) else 
			 7  when (vpos>=(VSTART+252) and vpos<(VSTART+288)) else 
			 8  when (vpos>=(VSTART+288) and vpos<(VSTART+324)) else 
			 9  when (vpos>=(VSTART+324) and vpos<(VSTART+360)) else 
			 10 when (vpos>=(VSTART+360) and vpos<(VSTART+396)) else 
			 11 when (vpos>=(VSTART+396) and vpos<(VSTART+432)) else 
			 12 when (vpos>=(VSTART+432) and vpos<(VSTART+468)) else
			 13;
			 
	col <= 0  when (hpos>=(HSTART+0)   and hpos<(HSTART+28)) else
			 1  when (hpos>=(HSTART+28)  and hpos<(HSTART+56)) else
			 2  when (hpos>=(HSTART+56)  and hpos<(HSTART+84)) else
			 3  when (hpos>=(HSTART+84)  and hpos<(HSTART+112)) else
			 4  when (hpos>=(HSTART+112) and hpos<(HSTART+140)) else
			 5  when (hpos>=(HSTART+140) and hpos<(HSTART+168)) else
			 6  when (hpos>=(HSTART+168) and hpos<(HSTART+196)) else
			 7  when (hpos>=(HSTART+196) and hpos<(HSTART+224)) else
			 8  when (hpos>=(HSTART+224) and hpos<(HSTART+252)) else
			 9  when (hpos>=(HSTART+252) and hpos<(HSTART+280)) else
			 10 when (hpos>=(HSTART+280) and hpos<(HSTART+308)) else
			 11 when (hpos>=(HSTART+308) and hpos<(HSTART+336)) else
			 12 when (hpos>=(HSTART+336) and hpos<(HSTART+364)) else
			 13 when (hpos>=(HSTART+364) and hpos<(HSTART+392)) else
			 14 when (hpos>=(HSTART+392) and hpos<(HSTART+420)) else
			 15 when (hpos>=(HSTART+420) and hpos<(HSTART+448)) else
			 16 when (hpos>=(HSTART+448) and hpos<(HSTART+476)) else
			 17 when (hpos>=(HSTART+476) and hpos<(HSTART+504)) else
			 18 when (hpos>=(HSTART+504) and hpos<(HSTART+532)) else
			 19 when (hpos>=(HSTART+532) and hpos<(HSTART+560)) else
			 20 when (hpos>=(HSTART+560) and hpos<(HSTART+588)) else
			 21 when (hpos>=(HSTART+588) and hpos<(HSTART+616)) else
			 22;
end rtl;