local function realpath (p)
	return (vim.uv.fs_realpath(p) or p)
end

return {
	on_init = function(client)
		local path = client.workspace_folders and client.workspace_folders[1].name

		if not path or vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '.luarc.jsonc') then
			return
		end
		local settings = {}

		if realpath(path) == realpath(vim.fn.stdpath('config')) then
			settings = require("lsp.lua_ls.nvim") 
		end

		if vim.uv.fs_stat(path .. '/conf.lua') or vim.uv.fs_stat(path .. '/main.lua') then
			settings = require("lsp.lua_ls.love")
		end


		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, settings)
	end,
	settings = {
		Lua = {},
	},
}
