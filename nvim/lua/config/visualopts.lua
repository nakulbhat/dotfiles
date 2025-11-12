vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true -- Stuff like the help menu opens at the bottom
vim.opt.splitright = true -- Vsplits open to the right
vim.opt.tabstop = 4       -- used when saving a file
vim.opt.shiftwidth = 4    -- used by >> and << for the indentation
vim.opt.expandtab = true  -- saving tabs as spaces
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10

vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

require("smear_cursor").enabled = true
vim.cmd('colorscheme monokai-pro')

local function get_wordcount()
    local word_count = 0

    if vim.fn.mode():find("[vV]") then
        word_count = vim.fn.wordcount().visual_words
    else
        word_count = vim.fn.wordcount().words
    end

    return word_count
end

local function wordcount()
    local label = "word"
    local word_count = get_wordcount()

    if word_count > 1 then
        label = label .. "s"
    end

    return word_count .. " " .. label
end

local function readingtime()
    -- 200 is about the average words read per minute.
    return tostring(math.ceil(get_wordcount() / 200.0)) .. " min"
end

local function is_prose()
    return vim.bo.filetype == "markdown" or vim.bo.filetype == "tex"
end

require("lualine").setup {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype', 'lsp_status' },
        lualine_y = { 'progress' },
        lualine_z = {
            { wordcount,   cond = is_prose },
            { readingtime, cond = is_prose },
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    options = {
        disabled_filetypes = { "minintro", "" },
    }
}
