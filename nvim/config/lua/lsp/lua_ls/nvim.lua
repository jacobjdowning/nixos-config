return {
	runtime = {
		version = 'LuaJIT',
		path = {
			'lua/?.lua',
			'lua/?/init.lua',
		},
	},

	workspace = {
		checkThirdParty = false;
		library = {
			vim.env.VIMRUNTIME,

			vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
		},
	},
	diagnostics = {
		globals = { 'vim' }
	},
}
