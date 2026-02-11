return {
    "nvim-tree/nvim-web-devicons",
    "ibhagwan/fzf-lua",
    "numToStr/Comment.nvim",
    "fedepujol/move.nvim",
    "Aasim-A/scrollEOF.nvim",
    "nvim-lua/plenary.nvim",
    "mikavilpas/yazi.nvim",
    "romainl/vim-cool",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
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
