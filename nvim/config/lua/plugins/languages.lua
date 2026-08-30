return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.lsp.config('lua_ls', require("lsp.lua_ls"))
			vim.lsp.config('nixd', require("lsp.nixd"))
			vim.lsp.enable({ "lua_ls", "nixd" })
		end,
	}
}
