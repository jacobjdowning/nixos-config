{ ... }:
{
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
}
