return {
  "nvim-tree/nvim-web-devicons",
  "neovim/nvim-lspconfig",
  "ibhagwan/fzf-lua",
  "numToStr/Comment.nvim",
  "fedepujol/move.nvim",
  "Aasim-A/scrollEOF.nvim",
  "sphamba/smear-cursor.nvim",
  "ggandor/leap.nvim",
  "nvim-lua/plenary.nvim",
  "mikavilpas/yazi.nvim",
  "romainl/vim-cool",
  "lervag/vimtex",

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "folke/snacks.nvim",
    config = function()
      require("snacks").setup({
        lazygit = { enabled = true },
      })
    end,
  },

  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.ai").setup({})
      require("mini.pairs").setup({})
    end,
  },

  {
    "eoh-bse/minintro.nvim",
    config = function()
      require("minintro").setup({})
    end,
  },

  {
    "Ramilito/winbar.nvim",
    config = function()
      require("winbar").setup({
        dir_levels = 2,
        filetype_exclude = { "minintro" },
      })
    end,
  },
}
