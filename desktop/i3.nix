{ lib, pkgs, config, ...}:
let
	wallpaper = pkgs.fetchurl{
		url = "https://4kwallpapers.com/images/wallpapers/algonquin-1920x1080-11432.jpg";
		hash = "sha256-jdqT3604qyc6TmsCWdrXTJQF6tiaFJDlBEP2lEFbcWU=";
	};

	cfg = config.xsession.windowManager.i3;
in
{
	xsession.windowManager.i3.enable = true;
	xsession.windowManager.i3.config = {
		modifier = "mod4";
		menu = "rofi -show drun";
		keybindings = lib.mkOptionDefault {
			"${cfg.config.modifier}+w" = "exec firefox";
			"${cfg.config.modifier}+p" = "exec rofi -show p -modi p:'rofi-power-menu'";
			"XF86Calculator" = "exec rofi -show calc -modi calc -no-show-match -no-sort";

			"${cfg.config.modifier}+h" = "focus left";
			"${cfg.config.modifier}+j" = "focus down";
			"${cfg.config.modifier}+k" = "focus up";
			"${cfg.config.modifier}+l" = "focus right";

			"${cfg.config.modifier}+Shift+h" = "move left";
			"${cfg.config.modifier}+Shift+j" = "move down";
			"${cfg.config.modifier}+Shift+k" = "move up";
			"${cfg.config.modifier}+Shift+l" = "move right";
		};
		startup = [
			{
				command = "feh --bg-fill ${wallpaper}";
				always = true;
				notification = false;
			}
		];
   		terminal = "alacritty";
   		bars = [];
		gaps = {
			inner = 6;
			outer = 4;
		};
		window = {
			titlebar = false;
		};
		colors = {
			focused = {
				border = "#89B482";
				background = "#89B482";
				indicator = "#89B482";
				childBorder = "#89B482";
				text = "#282828";
			};
			unfocused = {
				border = "#282828";
				background = "#282828";
				indicator = "#282828";
				childBorder = "#282828";
				text = "#d4BE98";
			};		
		};
	};
}
