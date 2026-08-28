return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.lsp.config('lua_ls', require("lsp.lua_ls"))
			vim.lsp.enable({ "lua_ls", "nixd" })
		end,
	}
}
