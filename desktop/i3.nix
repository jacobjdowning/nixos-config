{ lib, pkgs, ...}:
let
	wallpaper = pkgs.fetchurl{
		url = "https://4kwallpapers.com/images/wallpapers/algonquin-1920x1080-11432.jpg";
		hash = "sha256-jdqT3604qyc6TmsCWdrXTJQF6tiaFJDlBEP2lEFbcWU=";
	};
in
{
	xsession.windowManager.i3.enable = true;
	xsession.windowManager.i3.config = {
		keybindings = lib.mkOptionDefault {
      			"mod1+b" = "exec firefox";
      			"mod1+p" = "exec rofi -show drun";
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
