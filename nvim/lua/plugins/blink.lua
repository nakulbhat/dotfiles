return {
    "saghen/blink.cmp",
    version = '1.*',
    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
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
            default = { "lsp", "path", "snippets" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default"}
}
