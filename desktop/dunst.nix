{ pkgs, ... }:
{
	home.packages = with pkgs; [ libnotify ];

	services.dunst.enable = true;

	services.dunst.settings = {
		global = {
			frame_width = 2;
			font = "FiraCode Nerd Font:size=10;2";
			offset = "30x52";
		};
		urgency_normal = {
			background = "#282828";
			foreground = "#d4be98";
			frame_color = "#89b482";
		};
	};

}
