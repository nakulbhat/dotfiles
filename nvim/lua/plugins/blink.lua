return {
        "saghen/blink.cmp",
        dependencies = {
                "rafamadriz/friendly-snippets",
                "L3MON4D3/LuaSnip",
                "neovim/nvim-lspconfig",
        },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        opts = {
                keymap = { preset = "default", ["<C-k>"] = { "accept", "fallback" } },

                appearance = {
                        nerd_font_variant = "mono",
                },
                completion = { documentation = { auto_show = true } },
                signature = { enabled = true },
                snippets = { preset = "luasnip", },
                sources = {
                        default = { "lsp", "path", "snippets", "buffer" },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
        -- config = function() vim.api.nvim_set_keymap("i", "<Tab>", "<Nop>", { noremap = true }) end,
}
