{ pkgs, ... }:{
	programs.rofi = {
		enable = true;
		theme = ./gruvbox-material.rasi;
	};

	home.packages = [ pkgs.rofi-power-menu ];
}
