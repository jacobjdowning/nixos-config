return {
	runtime = {
		veriosn = 'LuaJIT',
	},
	workspace = {
		checkThirdParty = false,
		library = { '${3rd}/love2d/library', },
	},
	disgnostics = {
		globals = { 'love' },
	},
}
