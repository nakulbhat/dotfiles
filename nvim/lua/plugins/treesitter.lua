return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- optional but recommended
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = { "latex" },
            },
            indent = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "select inner part of a class region" },
                        ["as"] = { query = "@local.scope", query_group = "locals", desc = "select language scope" },
                    },
                    selection_modes = {
                        ["@parameter.outer"] = "v",     -- charwise
                        ["@function.outer"] = "v",      -- linewise
                        ["@class.outer"] = "<c-v>",     -- blockwise
                    },
                    include_surrounding_whitespace = true,
                },
            },
        })

        -- setup autotag (separate plugin)
        require("nvim-ts-autotag").setup({})
    end,
}
