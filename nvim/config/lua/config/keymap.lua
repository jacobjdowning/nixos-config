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
