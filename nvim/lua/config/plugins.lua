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
  "nvim-tree/nvim-web-devicons", -- icons in fzf-lua
  "ibhagwan/fzf-lua", -- for lgrep, finding files
  "numToStr/Comment.nvim", -- commenting using gc
  "fedepujol/move.nvim", -- moving lines with A-j/k
  "Aasim-A/scrollEOF.nvim", -- scroll past the end of a long file
  "sphamba/smear-cursor.nvim", -- cursor movement animations
  "kylechui/nvim-surround", -- ys, cs, ds, and vS
  "ggandor/leap.nvim", -- mouse emulations through s and S
}

require("nvim-surround").setup({})
