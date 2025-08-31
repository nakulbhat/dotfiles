require("mini.ai").setup {}
require("mini.pairs").setup {}
require("mini.splitjoin").setup {mappings = {toggle = "<leader> "}}

require("mini.keymap").setup {}
local map_combo = require("mini.keymap").map_combo

-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { "i", "c", "x", "s" }
map_combo(mode, "jk", "<BS><BS><Esc>")

-- To not have to worry about the order of keys, also map "kj"
map_combo(mode, "kj", "<BS><BS><Esc>")

-- Escape into Normal mode from Terminal mode
map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
map_combo("t", "kj", "<BS><BS><C-\\><C-n>")

require('mini.files').setup {}
MiniFiles = require('mini.files')
vim.keymap.set('n', '<leader>-', MiniFiles.open)

require('mini.notify').setup {}

require('mini.git').setup {}
require('mini.diff').setup {}
require('mini.statusline').setup {}
require('mini.tabline').setup {}

vim.opt.showtabline = 2
