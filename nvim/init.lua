vim.g.mapleader = " " -- lazy needs leaders to be loaded before itself
vim.g.maplocalleader = " "
require("config.lazy")
require("lazy").setup("plugins")
require('config.lsp')
require('config.iron')
require("config.behaveopts")
require("config.visualopts")

