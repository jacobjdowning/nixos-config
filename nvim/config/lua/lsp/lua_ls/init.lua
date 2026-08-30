local function realpath (p)
	return (vim.uv.fs_realpath(p) or p)
end

local function conditions(path)
	return {
		["lsp.lua_ls.nvim"] = realpath(path) == realpath(vim.fn.stdpath('config')) or realpath(path) .. '/nvim/config' == realpath(vim.fn.stdpath('config')),
		["lsp.lua_ls.love"] = vim.uv.fs_stat(path .. '/conf.lua') or vim.uv.fs_stat(path .. '/main.lua')
	}
end

local function get_settings_from_conditions(conds)
	for setting_location, cond in pairs(conds) do
		if cond then
			return require(setting_location)
		end
	end
	return {}
end

return {
	on_init = function(client)
		local path = client.workspace_folders and client.workspace_folders[1].name

		if not path or vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
			return
		end	
		local settings = get_settings_from_conditions(conditions(path))

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, settings)
	end,
	on_attach = require("lib.attach_autocomplete"), 
	settings = {
		Lua = {}
	},
}
