{ ... }:{ programs.battlenet-umu = {
	enable = true;
	games = [
		{ name = "Battle.net"; }
		{
			name = "Heroes of the Storm";
			path = "Program Files (x86)/Heroes of the Storm/Support64/HeroesSwitcher_x64.exe";
		}
		{
			name = "World of Warcraft";
			path = "Program Files (x86)/World of Warcraft/_retail_/Wow.exe";
		}
		{
			name = "WoW: Classic";
			path = "Program Files (x86)/World of Warcraft/_classic_era_/WowClassic.exe";
		}
	];
};}
