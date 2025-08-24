return {
        "saghen/blink.cmp",
        dependencies = {
                "rafamadriz/friendly-snippets",
        },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        opts = {
                keymap = { preset = "default", ["<C-s>"] = { "accept", "fallback" } },

                appearance = {
                        nerd_font_variant = "mono",
                },
                completion = { documentation = { auto_show = true } },
                signature = { enabled = true },
                sources = {
                        default = { "lsp", "path", "snippets", "buffer" },
                },
                snippets = {
                        preset = "luasnip",
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
        -- config = function() vim.api.nvim_set_keymap("i", "<Tab>", "<Nop>", { noremap = true }) end,
}
