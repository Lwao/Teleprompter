library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package vga_utils is
  constant COLOR_WHITE  : std_logic_vector := "111";
  constant COLOR_YELLOW : std_logic_vector := "110";
  constant COLOR_PURPLE : std_logic_vector := "101";
  constant COLOR_RED    : std_logic_vector := "100";
  constant COLOR_WATER  : std_logic_vector := "011";
  constant COLOR_GREEN  : std_logic_vector := "010";
  constant COLOR_BLUE   : std_logic_vector := "001";
  constant COLOR_BLACK  : std_logic_vector := "000";

  -- Values for 640x480 resolution
  constant HSYNC_END   : integer := 95;
  constant HDATA_BEGIN : integer := 143;
  constant HDATA_END   : integer := 783;
  constant HLINE_END   : integer := 799;

  constant VSYNC_END   : integer := 1;
  constant VDATA_BEGIN : integer := 34;
  constant VDATA_END   : integer := 514;
  constant VLINE_END   : integer := 524;

  constant H_EIGHTH  : integer := 640 / 8;
  constant H_HALF    : integer := 640 / 2;
  constant H_QUARTER : integer := 640 / 4;

  constant V_EIGHTH  : integer := 480 / 8;
  constant V_HALF    : integer := 480 / 2;
  constant V_QUARTER : integer := 480 / 4;
  
  constant VSTART : integer := 6+34;--7;
  constant VEND : integer := 514-7;--474;
  constant HSTART : integer := 12+143;--13;
  constant HEND : integer := 783-13;--628;
  
  constant CWIDTH : integer := 640;
  constant CHEIGHT : integer := 480;
  
	procedure Canvas (
		signal hpos, vpos  : in integer;
		signal canvas_en : out boolean
	);
	procedure Word (
		signal row, col  : in integer;
		signal word_en : out boolean
	);

end vga_utils;
  
package body vga_utils is
	procedure Canvas (
		signal hpos, vpos  : in integer;
		signal canvas_en : out boolean
		) is
	begin
		canvas_en <= (vpos>=VSTART) and (vpos<=VEND) and (hpos>=HSTART) and (hpos<=HEND);
	end Canvas;
	
	procedure Word (
		signal row, col  : in integer;
		signal word_en : out boolean
	) is
	begin
		word_en <= (row=10) and (col=6);
	end Word;
end vga_utils;