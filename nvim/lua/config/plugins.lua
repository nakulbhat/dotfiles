local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/lewis6991/pckr.nvim",
      pckr_path,
    })
  end
  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("pckr").add{
  "nvim-tree/nvim-web-devicons",
  "ibhagwan/fzf-lua",
  "numToStr/Comment.nvim",
  "fedepujol/move.nvim",
  "Aasim-A/scrollEOF.nvim",
  "sphamba/smear-cursor.nvim",
  "kylechui/nvim-surround",
  "ggandor/leap.nvim",
}

require("move").setup({})
require("nvim-surround").setup({})
