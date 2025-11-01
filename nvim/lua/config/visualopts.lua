vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true -- Stuff like the help menu opens at the bottom
vim.opt.splitright = true -- Vsplits open to the right
vim.opt.tabstop = 4 -- used when saving a file
vim.opt.shiftwidth = 4 -- used by >> and << for the indentation
vim.opt.expandtab = true -- saving tabs as spaces
vim.opt.termguicolors = true
vim.opt.cmdheight=1

vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

require("smear_cursor").enabled = true
