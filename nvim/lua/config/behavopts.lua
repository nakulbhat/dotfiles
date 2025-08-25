vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block" -- allows cursor to go off CR in visual BLOCK mode.

vim.opt.inccommand = "split" -- shows a preview of all changes in a separate bottom split.

vim.opt.ignorecase = true -- allow ignorecase in command line

vim.g.mapleader = " "

-- Custom function to format and then auto-indent
function FormatAndIndent()
        -- Call the LSP formatting function, which will use null-ls
        vim.lsp.buf.format {
                async = true,
                timeout_ms = 1000,
        }

        -- Wait a moment for the LSP to finish, then re-indent
        vim.defer_fn(function() vim.cmd.normal "gg=G" end, 200) -- Adjust the delay (in ms) if needed
end

-- Set the keymap for normal mode
vim.keymap.set("n", "<leader>cf", FormatAndIndent, { desc = "Format with LSP/null-ls and auto-indent" })

-- Optional: Add a visual mode mapping to indent a selection
vim.keymap.set("v", "<leader>cf", ":normal =<CR>", { desc = "Auto-indent selection" })
local opts = { noremap = true }

-- Keybinding for writing/saving a file
-- <leader>w maps to the `:write` command
-- The <CR> (carriage return) executes the command
vim.api.nvim_set_keymap("n", "<leader>w", ":write<CR>", opts)

-- Keybinding for quitting the current window
-- <leader>q maps to the `:quit` command
vim.api.nvim_set_keymap("n", "<leader>q", ":quit<CR>", opts)

-- Keybinding for aborting (quitting without saving)
-- <leader>a maps to the `:quit!` command
vim.api.nvim_set_keymap("n", "<leader>a", ":quit!<CR>", opts)
