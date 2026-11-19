{ pkgs, ... }:{
	programs.rofi = {
		enable = true;
		theme = ./gruvbox-material.rasi;
		plugins = with pkgs; [
			rofi-calc
		];
	};

	home.packages = [ pkgs.rofi-power-menu ];
}
