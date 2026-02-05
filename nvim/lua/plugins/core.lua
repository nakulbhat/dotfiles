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
    "Vigemus/iron.nvim",
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
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        -- vimtex isn't required if using treesitter
        dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        config = function()
            require 'luasnip-latex-snippets'.setup()
        end,
    },
    "rafamadriz/friendly-snippets",
}
