local E = { "saghen/blink.cmp" }

E.dependencies = {
        {
                "micangl/cmp-vimtex",
                dependencies = {
                        {
                                "saghen/blink.compat",
                                version = "*",
                                lazy = true,
                                opts = {},
                        },
                },
        },
}

E.opts = {
        sources = {
                default = { "vimtex" },
                providers = {
                        vimtex = {
                                name = "vimtex",
                                module = "blink.compat.source",
                                score_offset = 100,
                        },
                },
        },
}

return { E }
