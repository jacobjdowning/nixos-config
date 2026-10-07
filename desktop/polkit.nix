{ pkgs, ... }:
{
	home.packages = with pkgs; [ polkit_gnome ];
	
	xsession.windowManager.i3.config.startup = [
		{
			command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
			notification = false;
		}
	];
}
