vim.lsp.config("pyright", {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
})


vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" } }
        }
    }
})

vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("emmet_ls")
