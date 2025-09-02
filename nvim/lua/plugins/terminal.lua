return {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
                require('toggleterm').setup {}
                vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")
                vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
                vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
                vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>")
                vim.keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<CR>")
        end
}
