{ lib, ...}:
{
	xsession.windowManager.i3.enable = true;
	xsession.windowManager.i3.config = {
		keybindings = lib.mkOptionDefault {
      			"mod1+b" = "exec firefox";
      			"mod1+p" = "exec rofi -show drun";
   		};
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
				border = "#4F422E";
				background = "#4F422E";
				indicator = "#4F422E";
				childBorder = "#4F422E";
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
