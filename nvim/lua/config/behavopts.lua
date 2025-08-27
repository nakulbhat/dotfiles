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
