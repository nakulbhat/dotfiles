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
    {
        "kylechui/nvim-surround", -- for ys, ds, cs and vS
        config = function()
            require("nvim-surround").setup({})
        end
    }, 
    "ggandor/leap.nvim", -- mouse emulations through s and S
    "nvim-lua/plenary.nvim", -- library needed by yazi
    "mikavilpas/yazi.nvim", -- yazi itself
    {
        "folke/snacks.nvim", -- snacks used: lazygit
        config = function()
            require("snacks").setup({
                lazygit = {enabled = true },
            })
        end
    },
    {
        "nvim-mini/mini.nvim", -- modules used: ai, pairs, splitjoin
        config = function()
            require("mini.ai").setup({})
            require("mini.pairs").setup({})
        end
    },
    {
        "eoh-bse/minintro.nvim", -- minimal intro splash screen
        config = function()
            require("minintro").setup({})
        end
    },
    {
        "Ramilito/winbar.nvim", -- titlebar for windows
        config = function()
            require("winbar").setup({
                dir_levels = 2,
                filetype_exclude = {
                    "minintro"
                }
            })
        end
    },
    "romainl/vim-cool", -- turn off hl after search is over

}


