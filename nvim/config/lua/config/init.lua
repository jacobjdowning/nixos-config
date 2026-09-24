require("config.lazy")
require("config.options")
require("config.keymap")

--auto close terminal
vim.api.nvim_create_autocmd("TermClose", {
    once = true,
    callback = function()
        vim.cmd('bdelete!')
    end
})
