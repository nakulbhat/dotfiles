-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General settings
vim.opt.number = true             -- Show absolute line numbers
vim.opt.relativenumber = true     -- Show relative line numbers
vim.opt.syntax = 'on'             -- Enable syntax highlighting
vim.opt.termguicolors = true      -- Enable true colors in the terminal

-- Indentation
vim.opt.tabstop = 2               -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2            -- Number of spaces for indent
vim.opt.expandtab = true          -- Use spaces instead of tabs

-- Search settings
vim.opt.ignorecase = true         -- Ignore case in search patterns
vim.opt.smartcase = true          -- Smart case sensitive search

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus' -- Use the system clipboard for all operations

-- Mappings
-- jk for escape
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
