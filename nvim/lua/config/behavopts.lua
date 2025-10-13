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

local opts = { noremap = true, silent = true, nowait = true }

-- Save the current file using Alt + w
vim.keymap.set('n', '<A-w>', ':w<CR>', opts)

-- Quit Neovim without saving all buffers using Alt + q
vim.keymap.set('n', '<A-q>', ':qa!<CR>', opts)

-- Close current buffer without saving using Alt + c
vim.keymap.set('n', '<A-c>', ':bd!<CR>', opts)

-- Save and quit all open buffers using Alt + x
vim.keymap.set('n', '<A-x>', ':wqall<CR>', opts)

vim.keymap.set("n", "<CR>", "mao<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add new line below" })
vim.keymap.set("n", "<S-CR>", "maO<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add new line above" })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

vim.opt.spell = true
vim.opt.spelllang = 'en_gb'

vim.keymap.set("n", "<C-f>", "]s1z=<C-o>", {
  noremap = true,
  silent = true,
  desc = "Fix next spelling error (best suggestion)"
})

vim.keymap.set("i", "<C-f>", "<C-g>u<Esc>]s1z=`]a<C-g>u", {
  noremap = true,
  silent = true,
  desc = "Fix next spelling error (best suggestion)"
})


vim.keymap.set("n", "<C-r>", function()
  vim.cmd.normal({ "]s", bang = true })
  require("fzf-lua").spell_suggest()
end, { desc = "Next spelling error and open FzfLua suggestions" })

vim.keymap.set("i", "<C-r>", function()
  vim.cmd.normal({ "]s", bang = true })
  require("fzf-lua").spell_suggest()
  vim.cmd("startinsert")
end, { desc = "Next spelling error and open FzfLua (insert mode)" })

