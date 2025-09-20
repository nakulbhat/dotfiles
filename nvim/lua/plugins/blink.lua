return {
        "saghen/blink.cmp",
        event = "InsertEnter",
        dependencies = {
                "L3MON4D3/LuaSnip",
                "neovim/nvim-lspconfig",
        },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        opts = {
                keymap = { preset = "super-tab" },

                appearance = { nerd_font_variant = "mono" },
                completion = {
                        documentation = { auto_show = true },
                        selection = { auto_insert = false },
                        trigger = { show_in_snippet = false },
                },
                signature = { enabled = true },
                snippets = { preset = "luasnip" },
                sources = {
                        default = { "lsp", "path", "snippets", "buffer" },
                        providers = {
                                snippets = { score_offset = 150 },
                                lsp = { score_offset = 100 },
                        },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
        -- config = function() vim.api.nvim_set_keymap("i", "<Tab>", "<Nop>", { noremap = true }) end,
}
