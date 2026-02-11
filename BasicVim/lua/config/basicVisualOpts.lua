vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true -- Stuff like the help menu opens at the bottom
vim.opt.splitright = true -- Vsplits open to the right
vim.opt.tabstop = 4       -- used when saving a file
vim.opt.shiftwidth = 4    -- used by >> and << for the indentation
vim.opt.expandtab = true  -- saving tabs as spaces
vim.opt.termguicolors = false -- classic smaller range of colors
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10


vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
