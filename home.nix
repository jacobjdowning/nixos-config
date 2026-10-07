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
      lutris
      git
      vlc 
      unzip
      wowup-cf
      spotify
      discord
      libreoffice
      luarocks # for lazy.nvim
      ludusavi
      prismlauncher
      steam
      mupdf
      love
   ];

   imports = [ 
   	./g13
	./nvim
	./desktop
	./terminal
	./files
   ];

   g13.enable = true;

   services.udiskie.enable = true;
   services.udiskie.tray = "always";
   
   programs.rofi.enable = true;
   
   
   programs.home-manager.enable = true;
}
