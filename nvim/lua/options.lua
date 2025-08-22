-- Testing: Might be changed --
vim.opt.wrap = false -- might have problems with latex


-- Solid: Unlikely to be changed --
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true -- Stuff like the help menu opens at the bottom
vim.opt.splitright = true -- Vsplits open to the right

-- Indentation settings. 
-- 8 spaces is default,
-- but I put this here so I can edit it later.
vim.opt.tabstop = 8 -- used when saving a file
vim.opt.shiftwidth = 8 -- used by >> and << for the indentation
vim.opt.expandtab = true -- saving tabs as spaces

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999 -- keeps the cursor in the middle of the screen.

vim.opt.virtualedit = "block" -- allows cursor to go off CR in visual BLOCK mode.

vim.opt.inccommand = "split" -- shows a preview of all changes in a separate bottom split.

vim.opt.ignorecase = true -- allow ignorecase in command line

vim.opt.termguicolors = true
