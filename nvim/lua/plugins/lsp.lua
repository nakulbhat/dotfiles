return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require "lspconfig"
        lspconfig.pyright.setup {
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
        }
        lspconfig.lua_ls.setup {}
        -- add vim user dictionary for ltex-ls
        local path = vim.fn.stdpath "config" .. "/spell/en.utf-8.add"
        local words = {}

        for word in io.open(path, "r"):lines() do
            table.insert(words, word)
        end

        -- lspconfig.ltex_plus.setup {
        --         settings = {
        --                 ltex = {
        --                         language = "en-GB",
        --                         dictionary = { ["en-GB"] = words },
        --                         disabledRules = {
        --                                 ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
        --                         },
        --                 },
        --         },
        -- }

        lspconfig.emmet_ls.setup {}
        lspconfig.clangd.setup {}
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}
