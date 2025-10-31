local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")
Plug("nvim-tree/nvim-web-devicons")
Plug("ibhagwan/fzf-lua")
Plug("numToStr/Comment.nvim")

vim.call("plug#end")
