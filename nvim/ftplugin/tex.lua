-- This file is automatically sourced when a .tex file is opened.

                vim.g.maplocalleader = " " -- need to set localleader before loading lazy
-- Disable mini.splitjoin by overriding its mappings to a no-op.
require("mini.splitjoin").setup {
        mappings = {
                toggle = "<Nop>",
        },
}

local function toggle_reformat_join()
    if  vim.fn.strwidth(vim.api.nvim_get_current_line()) > 80 then
        print("tex gqq")
        vim.api.nvim_input("gqq")
    else
        print("tex vipJ0")
        vim.api.nvim_input("vipJ0")
    end
end -- Map your preferred keys to the built-in commands for LaTeX files.
vim.keymap.set("n", "<leader> ", toggle_reformat_join, { remap = false, buffer = true, desc = "Format Paragraph" })
