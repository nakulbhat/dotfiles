return {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        config = function()
                require("fzf-lua").setup { "fzf-native" }
                vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
                vim.keymap.set("n", "<leader>fg", ":FzfLua lgrep_curbuf<CR>")
                vim.keymap.set("n", "<leader>fv", ":vnew<CR>:FzfLua files<CR>")
                vim.keymap.set("n", "<leader>fh", ":new<CR>:FzfLua files<CR>")
                vim.keymap.set("n", "<leader>ft", ":FzfLua tabs<CR>")
        end,
        opts = {},
}
