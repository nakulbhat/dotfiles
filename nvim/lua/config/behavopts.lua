
vim.opt.clipboard = "unnamedplus"


vim.opt.virtualedit = "block" -- allows cursor to go off CR in visual BLOCK mode.

vim.opt.inccommand = "split" -- shows a preview of all changes in a separate bottom split.

vim.opt.ignorecase = true -- allow ignorecase in command line


vim.g.mapleader = " "

-- Custom function to format and then auto-indent
function FormatAndIndent()
	-- Call the LSP formatting function, which will use null-ls
	vim.lsp.buf.format({
		async = true,
		timeout_ms = 1000,
	})

	-- Wait a moment for the LSP to finish, then re-indent
	vim.defer_fn(function()
		vim.cmd.normal("gg=G")
	end, 200) -- Adjust the delay (in ms) if needed
end

-- Set the keymap for normal mode
vim.keymap.set("n", "<leader>cf", FormatAndIndent, { desc = "Format with LSP/null-ls and auto-indent" })

-- Optional: Add a visual mode mapping to indent a selection
vim.keymap.set("v", "<leader>cf", ":normal =<CR>", { desc = "Auto-indent selection" })
