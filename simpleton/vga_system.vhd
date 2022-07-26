library ieee;
use ieee.std_logic_1164.all;

entity vga_system is
	port (
		clk: in std_logic;
		rgb   : out std_logic_vector (2 downto 0); 
		hsync, vsync : out std_logic
	);
end vga_system;

architecture rtl of vga_system is
	
	component qsys_vga is
		port (
			clk_clk             : in  std_logic                    := '0'; --           clk.clk
			vga_interface_rgb   : out std_logic_vector(2 downto 0);        -- vga_interface.rgb
			vga_interface_hsync : out std_logic;                           --              .hsync
			vga_interface_vsync : out std_logic                            --              .vsync
		);
	end component;
		
begin

NIOS2_SYS : qsys_vga port map (
				clk_clk=>clk, 
				vga_interface_rgb=>rgb, 
				vga_interface_hsync=>hsync,
				vga_interface_vsync=>vsync);
end rtl;