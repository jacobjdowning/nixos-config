return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require("dap")
			dap.adapters.love = function(callback, config)
				callback({
					type = "executable",
					command = "love",
					args = { config.root }
				})
			end

			--Load project specific config
			vim.api.nvim_create_autocmd("LspAttach",{
				once = true,
				callback = function()
					local root = vim.lsp.buf.list_workspace_folders()[1]
					if not root then return end
					local config_path = root .. "/.nvim/dap.lua"
					if vim.fn.filereadable(config_path) == 1 then
						pcall(dofile, config_path)
					end
				end,
			})
		end
	}
}
