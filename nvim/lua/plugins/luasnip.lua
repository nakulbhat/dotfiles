return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    build = "make install_jsregexp",
    config = function()
        local ls = require "luasnip"
        require("luasnip.loaders.from_vscode").lazy_load()
        ls.config.set_config {
            history = false,
            enable_autosnippets = true,
        }
    end,
}
