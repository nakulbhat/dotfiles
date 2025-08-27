return {
        "chrisgrieser/nvim-genghis",
        config = function()
                -- default config
                require("genghis").setup {
                        ---@type fun(): string|string[]
                        trashCmd = function()
                                if jit.os == "OSX" then return "trash" end -- builtin since macOS 14
                                if jit.os == "Windows" then return "trash" end
                                if jit.os == "Linux" then return { "gio", "trash" } end
                                return "trash-cli"
                        end,

                        navigation = {
                                onlySameExtAsCurrentFile = false,
                                ignoreDotfiles = true,
                                ignoreExt = { "png", "svg", "webp", "jpg", "jpeg", "gif", "pdf", "zip", "DS_Store" },
                        },

                        successNotifications = true,

                        icons = { -- set to empty string to disable
                                chmodx = "󰒃",
                                copyFile = "󱉥",
                                copyPath = "󰅍",
                                duplicate = "",
                                file = "󰈔",
                                move = "󰪹",
                                new = "󰝒",
                                nextFile = "󰖽",
                                prevFile = "󰖿",
                                rename = "󰑕",
                                trash = "󰩹",
                        },
                }
        end,
}
