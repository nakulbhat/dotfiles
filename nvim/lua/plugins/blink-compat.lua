return {
  -- add blink.compat
  {
    'saghen/blink.compat',
    -- use v2.* for blink.cmp v1.*
    version = '2.*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },

  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      -- add source
      { 'micangl/cmp-vimtex' },
    },
    sources = {
      -- remember to enable your providers here
      default = { 'lsp', 'path', 'snippets', 'buffer', 'cmp_vimtex' },
      providers = {
        -- create provider
        cmp_vimtex = {
          -- IMPORTANT: use the same name as you would for nvim-cmp
          name = 'cmp_vimtex',
          module = 'blink.compat.source',

          -- all blink.cmp source config options work as normal:
          score_offset = -3,

          -- this table is passed directly to the proxied completion source
          -- as the `option` field in nvim-cmp's source config
          --
          -- this is NOT the same as the opts in a plugin's lazy.nvim spec
        },
      },
    },
  },
}
