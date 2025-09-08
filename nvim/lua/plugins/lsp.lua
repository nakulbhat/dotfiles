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
                lspconfig.clangd.setup {}
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
}
