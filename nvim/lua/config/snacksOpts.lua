Snacks = require("snacks")

vim.keymap.set('n', '<leader>sde', Snacks.dim.enable)
vim.keymap.set('n', '<leader>sdd', Snacks.dim.disable)

vim.keymap.set('n', '<leader>lg', Snacks.lazygit.open)
