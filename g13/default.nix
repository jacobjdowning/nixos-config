{ pkgs, lib, config, ...}:
let
	g13 = pkgs.callPackage ./pkg.nix {};
in
{
	options.g13.enable = lib.mkEnableOption "Service for the Logitech G13 keypad";

	config = lib.mkIf config.g13.enable {
		home.packages = [ g13 ];
		
		home.file.".config/g13/g13.conf".source = ./g13.conf;

		systemd.user.services.g13d = {
			Unit.Description = "Logitech G13 Daemon";	
			Service = {
				Type = "simple";
				ExecStart = "${g13}/bin/g13d --config %h/.config/g13/g13.conf --pipe_in /tmp/g13-0 --pipe_out /tmp/g13-0_out";
				Restart = "on-failure";
			};
			Install.WantedBy = [ "default.target" ];
		};
	};
}
