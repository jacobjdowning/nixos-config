{ pkgs, config, ... }:
{
	home.packages = with pkgs; [
		neovim
      		luarocks # for lazy.nvim
		#Language Servers
		nixd
		lua-language-server
		bash-language-server
		basedpyright
	];

	xdg.configFile."nvim" = {
		source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/nvim/config";
		recursive = true;
	};
}
