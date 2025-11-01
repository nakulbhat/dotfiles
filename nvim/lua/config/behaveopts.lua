vim.opt.clipboard = "unnamedplus"
vim.opt.virtualedit = "block" -- allows cursor to go off CR in visual BLOCK mode.
vim.opt.inccommand = "split" -- shows a preview of all changes in a separate bottom split.
vim.opt.ignorecase = true -- allow ignorecase in command line
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.spell = true
vim.opt.spelllang = 'en_gb'
vim.keymap.set('i', '<C-f>', [[<C-g>u<Esc>[s1z=`]a<C-g>u]], { noremap = true, desc = "Fix previous spelling-like change in insert mode" })
vim.keymap.set('n', '<C-f>', "[s1z=<C-o>", { noremap = true, desc = "Run the [s1z= command then jump back" })

function FormatAndIndent()
    vim.lsp.buf.format { async = false, timeout_ms = 1000, }
    vim.cmd.normal "gg=G"
end
vim.keymap.set("n", "<leader>cf", FormatAndIndent, { desc = "Format with LSP/null-ls and auto-indent" })

local no_wait_opts = { noremap = true, silent = true, nowait = true }
local general_opts = { noremap = true, silent = true}

--saving, quitting and closing
vim.keymap.set('n', '<A-w>', ':w<CR>', no_wait_opts)
vim.keymap.set('n', '<A-q>', ':qa!<CR>', no_wait_opts)
vim.keymap.set('n', '<A-c>', ':bd!<CR>', no_wait_opts)
vim.keymap.set('n', '<A-x>', ':wqall<CR>', no_wait_opts)

-- adding empty lines above and below current line
vim.keymap.set("n", "<CR>", "mao<esc>0<S-d>`a<cmd>delmarks a<cr>")
vim.keymap.set("n", "<S-CR>", "maO<esc>0<S-d>`a<cmd>delmarks a<cr>")

-- moving to different visible windows
vim.keymap.set('n', '<C-h>', '<C-w>h', general_opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', general_opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', general_opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', general_opts)


-- Moving lines
require("move").setup({})
vim.keymap.set({'n','v'}, '<A-j>', ':MoveLine(1)<CR>', general_opts)
vim.keymap.set({'n','v'}, '<A-k>', ':MoveLine(-1)<CR>', general_opts)
vim.keymap.set({'n','v'}, '<A-h>', ':MoveHChar(-1)<CR>', general_opts)
vim.keymap.set({'n','v'}, '<A-l>', ':MoveHChar(1)<CR>', general_opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', general_opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', general_opts)

-- fzf lua setup
require("fzf-lua").setup { "fzf-native" }
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":FzfLua lgrep_curbuf<CR>")
vim.keymap.set("n", "<leader>fv", ":vnew<CR>:FzfLua files<CR>")
vim.keymap.set("n", "<leader>fh", ":new<CR>:FzfLua files<CR>")

-- leap setup
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', { silent = true })
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)', { silent = true })

-- yazi setup
require("yazi").setup({})
vim.keymap.set("n", "<leader>-", function() require("yazi").yazi() end)

-- snacks: lazygit
Snacks = require("snacks")
vim.keymap.set('n', '<leader>lg', Snacks.lazygit.open)
