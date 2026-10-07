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
      glib
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
   ];

   g13.enable = true;

   services.udiskie.enable = true;
   services.udiskie.tray = "always";
   
   programs.rofi.enable = true;
   
   programs.ranger = {
      enable = true;
      rifle = [
         { condition = "mime ^video"; command = "vlc -- \"$@\""; }
         { condition = "mime ^text"; command = "nvim -- \"$@\""; }
	 { condition = "mime ^application/pdf"; command = "mupdf -- \"$@\""; }
      ];
   };
   
   programs.home-manager.enable = true;
}
