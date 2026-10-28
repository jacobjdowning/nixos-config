{ pkgs, ... }:
{
	home.packages = with pkgs; [
		lutris
		wowup-cf
		ludusavi
		prismlauncher
		steam
	];

	imports = [
		./battlenet.nix
	];
}
