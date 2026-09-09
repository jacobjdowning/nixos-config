{ pkgs, ...}:
{
	services.polybar = {
		enable = true;
		package = pkgs.polybar.override {
			i3Support = true;
		};
		script = "polybar main &";
		settings = {
			"bar/main" = {
				width = "100%";
				height = "24px";
				bottom = false;

				modules-left = "i3";
			};
			"module/i3" = {
				type = "internal/i3";
			};
		};
	};
}
