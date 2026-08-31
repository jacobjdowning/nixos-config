return {
	on_attach = require('lib.attach_autocomplete'),
	settings = {
		nixd = {
			options = {
				-- These options are not very portable. I would like to change them
				-- in the future. 
				-- 1) if I have to use the location of my flake in 1 more place I'm
				-- going to put it into a env variable in my flake 
				-- 2) I don't really know how to use a different host automatically
				-- will have to look into that
				nixos = {
					expr = '(builtins.getFlake "/home/jjd/nixos-config").nixosConfigurations.shadowmoon.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/jjd/nixos-config").nixosConfigurations.shadowmoon.options.home-manager.users.type.getSubOptions []',
				},
			}
		}
	}
}
