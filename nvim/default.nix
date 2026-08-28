{ pkgs, config, ... }:
{
	home.packages = with pkgs; [
		neovim
		#Language Servers
		nixd
		lua-language-server
	];

	xdg.configFile."nvim" = {
		source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/nvim/config";
		recursive = true;
	};
}
