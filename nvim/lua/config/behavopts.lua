

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

-- Keybinding for writing a file
-- <leader>wb maps to the `:write` command
vim.api.nvim_set_keymap("n", "<leader>ww", ":write<CR>", { noremap = true, silent = true })

-- Keybinding for writing and closing the current window
-- <leader>wc maps to the `:write` and `:quit` commands
vim.api.nvim_set_keymap("n", "<leader>c", ":write | :quit<CR>", { noremap = true, silent = true })

-- Keybinding for writing all buffers and quitting Neovim
-- <leader>wq maps to the `:wqall` command
vim.api.nvim_set_keymap("n", "<leader>wq", ":wqall<CR>", { noremap = true, silent = true })

-- Keybinding for aborting everything (quitting without saving)
-- <leader>q maps to the `:quit!` command
vim.api.nvim_set_keymap("n", "<leader>q", ":quit!<CR>", { noremap = true, silent = true })
--- Creates a new file at a specified path, automatically creating parent directories.
-- @param base_dir string The base directory to create the new file in.
local function create_new_file(base_dir)
        -- If base_dir is nil or empty, default to the current working directory.
        local resolved_base_dir = base_dir and base_dir ~= "" and base_dir or vim.fn.getcwd()

        -- Use vim.ui.input to get the new file path from the user.
        -- The prompt will include the base directory for context.
        vim.ui.input({
                prompt = "Create new file in " .. resolved_base_dir .. ": ",
        }, function(new_file_path)
                        -- Exit if the user cancels the prompt.
                        if not new_file_path then
                                print "File creation cancelled."
                                return
                        end

                        -- Construct the full path for the new file.
                        local full_path = resolved_base_dir .. "/" .. new_file_path

                        -- Get the parent directory of the new file.
                        -- This handles cases like 'dir1/dir2/file.txt' correctly.
                        local parent_dir = vim.fn.fnamemodify(full_path, ":h")

                        -- Check if the parent directory exists. If not, create it.
                        -- The 'p' flag makes it create all necessary parent directories.
                        if vim.fn.isdirectory(parent_dir) == 0 then vim.fn.mkdir(parent_dir, "p", " ") end

                        -- Create an empty file. `vim.fn.writefile` will create it if it doesn't exist.
                        -- The 'a' flag appends to the file, which is safe here as it's empty.
                        vim.fn.writefile({}, full_path, "a")

                        -- Open the newly created file in the current window.
                        vim.cmd("e " .. full_path)
                end)
end

-- Expose the function globally so it can be called from outside.
_G.create_new_file = create_new_file

-- --- Example Usage ---
--
-- This is how you would use this function.
-- You can integrate this with your fzf-lua command.
--
-- For example, you could map it to a keybind like so:
--
vim.keymap.set("n", "<leader>nf", function()
        require("fzf-lua").fzf_exec("find . -path ./.git -prune -o -type d -print", {
                actions = {
                        ["default"] = function(selected_path) create_new_file(selected_path[1]) end,
                },
        })
end, { desc = "Create new file via fzf-lua" })

vim.keymap.set("n", "<CR>", "mao<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add new line below" })
vim.keymap.set("n", "<S-CR>", "maO<esc>0<S-d>`a<cmd>delmarks a<cr>", { desc = "Add new line above" })



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
