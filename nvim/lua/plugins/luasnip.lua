return {
"L3MON4D3/LuaSnip",
dependencies = {
        "evesdropper/luasnip-latex-snippets.nvim",
        "rafamadriz/friendly-snippets",
},
build = "make install_jsregexp",
config = function()
        local ls = require "luasnip"
        ls.config.set_config {
                history = false,
                enable_autosnippets = true,
        }
        require("luasnip.loaders.from_vscode").lazy_load()
end,
}
