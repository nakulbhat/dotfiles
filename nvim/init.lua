local vim = vim
local Plug = vim.fn["plug#"]

require("config.behaveopts")
require("config.visualopts")

vim.call("plug#begin")
Plug("nvim-tree/nvim-web-devicons")
Plug("ibhagwan/fzf-lua")
Plug("numToStr/Comment.nvim")
Plug("fedepujol/move.nvim")
Plug 'Aasim-A/scrollEOF.nvim'
Plug 'sphamba/smear-cursor.nvim'
Plug 'kylechui/nvim-surround'
Plug("ggandor/leap.nvim")
vim.call("plug#end")
require("move").setup({})
require("nvim-surround").setup({})
