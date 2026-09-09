{ pkgs, ...}:
{
	services.polybar = {
		enable = true;
		package = pkgs.polybar.override {
			i3Support = true;
		};
		script = "polybar main &";
		settings = {
			"colors" = {
				bg0 = "#282828";
				bg-current-word = "#3c3836";
				fg0 = "#d4be98";
				grey0 = "#7c6f64";
				red = "#ea6962";
				green = "#a9b665";
				aqua = "#89b482";
			};

			"bar/main" = {
				width = "100%";
				height = "24px";
				bottom = false;

				background = "\${colors.bg0}";
				foreground = "\${colors.fg0}";

				font-0 = "FiraCode Nerd Font:size=10;2";
				underline-size = 2;
				
				modules-left = "i3";
				modules-center = "date";
			};
			"module/i3" = {
				type = "internal/i3";
				format = "<label-state>";
				index-sort = true;
				wrapping-scroll = false;

				label-focused = "%index%";
				label-focused-background = "\${colors.bg-current-word}";
				label-focused-underline = "\${colors.aqua}";
				label-focused-padding = 1;

				label-unfocused = "%index%";
				label-unfocused-padding = 1;

				label-urgent = "%index%";
				label-urgent-background = "\${colors.red}";
				label-urgent-padding = 1;
			};

			"module/date" = {
				type = "internal/date";
				interval = 1;
				date = "%Y-%m-%d %H:%M:%S";
				label = "%date%";
			};
		};
	};
}

