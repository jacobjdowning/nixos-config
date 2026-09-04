{ config, pkgs, lib, ... }:
{
   xsession.enable = true;
   xsession.windowManager.i3.enable = true;
   xsession.windowManager.i3.config.keybindings = lib.mkOptionDefault {
      "mod1+b" = "exec firefox";
      "mod1+p" = "exec rofi -show drun";
   };
   xsession.windowManager.i3.config.terminal = "alacritty";

   home.username = "jjd";
   home.homeDirectory = "/home/jjd";

   # Matches the NixOS release - same idea as system.stateVersion in configuration.nix
   home.stateVersion = "26.05";

   home.packages = with pkgs; [
      alacritty
      firefox
      polkit_gnome
      libnotify
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
   ];

   imports = [ 
   	./g13
	./nvim
   ];

   g13.enable = true;

   xsession.windowManager.i3.config.startup = [
      {
         command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
	 notification = false;
      }
   ];

   services.dunst.enable = true;

   services.picom = {
   	enable = true;
   	vSync = true;
	backend = "glx";
	settings = {
		unredir-if-possible = true;
		unredir-if-possible-exclude = [
			"class_g = 'firefox'"
			"class_g = 'vlc'"
		];
	};
   };

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
   programs.i3status.enable = true;
}
