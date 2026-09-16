{ pkgs, ... }:
{
	xsession.enable = true;
	
	home.packages = with pkgs; [
		feh
	];

	imports = [
		./i3.nix
		./polybar.nix
		./theme.nix
	];
}
