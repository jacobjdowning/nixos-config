--Exit i and v with jk  
vim.keymap.set({'i', 'v'}, 'jk', '<Esc>')
vim.keymap.set({'i', 'v'}, '<Esc>', '<Nop>')
--autocomplete Tab and enter
vim.keymap.set('i', '<Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-n>'
	end
	return '<Tab>'
end, { expr = true})

vim.keymap.set('i', '<S-Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-p>'
	end
	return '<S-Tab>'
end, { expr = true })

vim.keymap.set('i', '<CR>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-y>'
	end
	return '<CR>'
end, { expr = true })

-- lsp
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show Diagnostic dialogue" })

--debug
local dap = require("dap")
vim.keymap.set('n', '<f5>', function()
	local root = vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd()
	root = root .. "/.nvim"
	if vim.fn.filereadable(root .. "/dap.lua") == 1 then
		dap.continue()
	elseif vim.fn.filereadable(root .. "/launch.lua") == 1 then
		vim.cmd('split | terminal ' .. dofile(root.."/launch.lua"))
	end
end, {desc = "Run task or contiue debugger"})

--nvim tree
local nvim_tree = require("nvim-tree.api")
vim.keymap.set('n', '<leader>b', nvim_tree.tree.toggle , {desc = "Toggle nvim tree pane"})
