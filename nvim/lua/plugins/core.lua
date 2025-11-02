return {
   "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
    "ibhagwan/fzf-lua",
    "numToStr/Comment.nvim",
    "fedepujol/move.nvim",
    "Aasim-A/scrollEOF.nvim",
    "sphamba/smear-cursor.nvim",
    "ggandor/leap.nvim",
    "nvim-lua/plenary.nvim",
    "mikavilpas/yazi.nvim",
    "romainl/vim-cool",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "loctvl842/monokai-pro.nvim",
        priority = 1000,
        config = function()
            require("monokai-pro").setup()
        end
    },
    "lervag/vimtex",
    "Vigemus/iron.nvim",
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    },

    {
        "folke/snacks.nvim",
        config = function()
            require("snacks").setup({
                lazygit = { enabled = true },
            })
        end,
    },

    {
        "nvim-mini/mini.nvim",
        config = function()
            require("mini.ai").setup({})
            require("mini.pairs").setup({})
        end,
    },

    {
        "eoh-bse/minintro.nvim",
        config = function()
            require("minintro").setup({})
        end,
    },
}
