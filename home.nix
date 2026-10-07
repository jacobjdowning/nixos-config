{ pkgs, ... }:
{

   home.username = "jjd";
   home.homeDirectory = "/home/jjd";

   # Matches the NixOS release - same idea as system.stateVersion in configuration.nix
   home.stateVersion = "26.05";

   home.packages = with pkgs; [
      firefox
      backintime
      backintime-common
      sshfs
      git
      unzip
      spotify
      discord
      libreoffice
      luarocks # for lazy.nvim
      love
   ];

   imports = [ 
   	./g13
	./nvim
	./desktop
	./terminal
	./files
	./games
   ];

   g13.enable = true;

   services.udiskie.enable = true;
   services.udiskie.tray = "always";
   
   programs.rofi.enable = true;
   
   programs.home-manager.enable = true;
}
