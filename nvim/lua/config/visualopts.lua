-- Solid: Unlikely to be changed --
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true -- Stuff like the help menu opens at the bottom
vim.opt.splitright = true -- Vsplits open to the right

-- Indentation settings. 
-- 8 spaces is default,
-- but I put this here so I can edit it later.
vim.opt.tabstop = 4 -- used when saving a file
vim.opt.shiftwidth = 4 -- used by >> and << for the indentation
vim.opt.expandtab = true -- saving tabs as spaces

vim.opt.termguicolors = true

vim.opt.cmdheight = 0
vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
