{ pkgs, ... }:
{
	home.packages = with pkgs; [ glib ];

	programs.ranger = {
		enable = true;
		rifle = [
			{
				condition = "mime ^video";
				command = "vlc -- \"$@\"";
			}
			{
				condition = "mime ^text";
				command = "nvim -- \"$@\"";
			}
			{ 
			 	condition = "mime ^application/pdf"; 
			 	command = "mupdf -- \"$@\"";
			}
		];
	};

}
