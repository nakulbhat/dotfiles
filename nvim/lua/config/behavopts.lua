vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block" -- allows cursor to go off CR in visual BLOCK mode.

vim.opt.inccommand = "split" -- shows a preview of all changes in a separate bottom split.

vim.opt.ignorecase = true -- allow ignorecase in command line

vim.g.mapleader = " "

function FormatAndIndent()
        vim.lsp.buf.format {
                async = false,
                timeout_ms = 1000,
        }
        vim.cmd.normal "gg=G"
end

vim.keymap.set("n", "<leader>cf", FormatAndIndent, { desc = "Format with LSP/null-ls and auto-indent" })

vim.api.nvim_set_keymap("n", "<leader>ww", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qa", ":q!<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<CR>", "mao<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add new line below" })
vim.keymap.set("n", "<S-CR>", "maO<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add new line above" })

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


vim.opt.mouse = ""
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

