{ stdenv, fetchFromGitHub, lib, makeWrapper, coreutils, gnused, gawk, bc, curl, jq }:
let
	# Generates a string for a sed command that will replace
	# each instance of a specified variable in variables in a
	# shell script with the value in variables.
	# variables is a set with the keys as the variable
	# names and the values as their new values
	generateVariableReplacement = variables: path: let 
		escSl = value: lib.strings.replaceString "/" "\\/" value;
	in
		lib.strings.join "" ([ "sed -i " ] ++
		(map (x: "-e 's/${x.name}=.*/${x.name}=\"${escSl x.value}\"/' ") 
			(lib.attrsToList variables))
		++  [ path ]);
in
stdenv.mkDerivation (finalAttrs: {
	pname = "polybar-weather";
	version = "0.0.1";

	src = fetchFromGitHub {
		owner = "skafiend";
		repo = "polybar-weather";
		rev = "237e253c9661432c263f6a856202847452606689";
		hash = "sha256-SevrlmWe/UehyY0pdL0+NjEw2OJpVxbGBrpwzmh6kyc=";
	};

	postPatch = generateVariableReplacement {	

		APIKEY = lib.trim (builtins.readFile ./openweather.key); 
		# Cache should get XDG_CACHE_HOME as an argument from homemanager module
		CACHE = "/home/jjd/.cache/polybar/weather-last";
		CITY_NAME = "Toronto";
		COUNTRY_CODE = "CA";
		DISPLAY_LABEL = "no";
		DISPLAY_WIND = "no";
		TEMP_FONT_CODE="4";

		COLOR_CLOUD="#504945";        # bg_statusline3
		COLOR_THUNDER="#d4be98";      # fg0
		COLOR_LIGHT_RAIN="#7daea3";   # blue
		COLOR_HEAVY_RAIN="#7daea3";   # blue (see note)
		COLOR_SNOW="#ddc7a1";         # fg1
		COLOR_FOG="#5a524c";          # bg5
		COLOR_TORNADO="#d4be98";      # fg0
		COLOR_SUN="#d8a657";          # yellow
		COLOR_MOON="#d8a657";         # yellow
		COLOR_ERR="#ea6962";          # red
		COLOR_WIND="#89b482";         # aqua
		COLOR_COLD="#7daea3";         # blue
		COLOR_HOT="#ea6962";          # red
		COLOR_NORMAL_TEMP="#ddc7a1";  # fg1

	} "weather-plugin.sh" + 
		";sed -i '321i\\mkdir -p \"$(dirname \"$CACHE\")\"' weather-plugin.sh";

	nativeBuildInputs = [ makeWrapper ];

	dontBuild = true;

	installPhase = ''
		runHook preInstall
		
		install -Dm755 weather-plugin.sh $out/bin/polybar-weather
		wrapProgram $out/bin/polybar-weather \
			--set PATH ${lib.makeBinPath [ 
				coreutils
				gnused
				gawk
				bc
				curl
				jq
			]}

		runHook postInstall
	'';
})
