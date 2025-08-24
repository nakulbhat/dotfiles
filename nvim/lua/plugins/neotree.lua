return {
        {
                "nvim-neo-tree/neo-tree.nvim",
                branch = "v3.x",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "MunifTanjim/nui.nvim",
                        "nvim-tree/nvim-web-devicons", -- optional, but recommended
                },
                lazy = false, -- neo-tree will lazily load itself
                config = function()
                        require("neo-tree").setup {
                                window = {
                                        mappings = {
                                                ["e"] = function() vim.api.nvim_exec("Neotree focus filesystem left", true) end,
                                                ["b"] = function() vim.api.nvim_exec("Neotree focus buffers left", true) end,
                                                ["g"] = function() vim.api.nvim_exec("Neotree focus git_status left", true) end,
                                        },
                                },
                        }
                        vim.keymap.set("n", "<C-g>", ":Neotree filesystem toggle left<CR>")
                        event_handlers = {

                                {
                                        event = "file_open_requested",
                                        handler = function() vim.cmd "Neotree close" end,
                                },
                        }
                end,
        },
}
