{ pkgs, ... }:
{
	home.pointerCursor = {
		x11.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 24;
	};
}
