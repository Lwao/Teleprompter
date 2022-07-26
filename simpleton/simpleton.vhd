library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_utils.all;

entity simpleton is
  port (
    clk, rst : in std_logic;
	 write_en: in std_logic;
	 data_in: in std_logic_vector (7 downto 0);
    rgb   : out std_logic_vector (2 downto 0); 
    hsync, vsync : out std_logic;
	 read_en : out std_logic
  );
end entity simpleton;

architecture rtl of simpleton is
  -- VGA Clock - 25 MHz clock derived from the 50MHz built-in clock
  signal vga_clk : std_logic;

  signal rgb_input, rgb_output : std_logic_vector(2 downto 0);
  signal vga_hsync, vga_vsync  : std_logic;
  signal hpos, vpos : integer range 0 to CWIDTH;
  signal row, col : integer range 0 to 22;
  
  signal canvas_en, word_en : boolean;

  component vga_controller is
    port (
      clk     : in std_logic;
      rgb_in  : in std_logic_vector (2 downto 0);
      rgb_out : out std_logic_vector (2 downto 0);
      hsync   : out std_logic;
      vsync   : out std_logic;
      hpos    : out integer;
      vpos    : out integer
    );
  end component;
  
  component rowcol_sel is
		port(
			hpos, vpos : in integer;
			row, col : buffer integer
			);
	end component;
begin
  controller : vga_controller port map(
    clk     => vga_clk,
    rgb_in  => rgb_input,
    rgb_out => rgb_output,
    hsync   => vga_hsync,
    vsync   => vga_vsync,
    hpos    => hpos,
    vpos    => vpos
  );
  
  matrix_converter : rowcol_sel port map(hpos, vpos, row, col);

  rgb   <= rgb_output;
  hsync <= vga_hsync;
  vsync <= vga_vsync;
  Canvas(hpos, vpos, canvas_en);
  Word(row, col, word_en);
  read_en <= '1' when word_en else '0';

  -- We need 25MHz for the VGA so we divide the input clock by 2
  process (clk)
  begin
    if (rising_edge(clk)) then
      vga_clk <= not vga_clk;
    end if;
  end process;

  -- draw process
  process (vga_clk)
  begin
    if (rising_edge(vga_clk)) then
      if (canvas_en) then 
			if(col=0 or row=0 or col=21 or row=12) then
				rgb_input <= COLOR_BLUE;
			else 
				rgb_input <= COLOR_WHITE;
			end if;
      else rgb_input <= COLOR_BLACK; end if;
		if (write_en='1') then rgb_input <= COLOR_YELLOW; end if;
    end if;
  end process;
end architecture;