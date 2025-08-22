return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config('luals', {
        cmd = {'lua-language-server'},
        filetypes = {'lua'},
        root_markers = {'.luarc.json', '.luarc.jsonc'},
      })
      vim.lsp.enable('luals')
      vim.lsp.config('ltex_plus', {
        cmd = { 'ltex-ls-plus' },
        filetypes = {
          'bib',
          'context',
          'gitcommit',
          'html',
          'markdown',
          'org',
          'pandoc',
          'plaintex',
          'quarto',
          'mail',
          'mdx',
          'rmd',
          'rnoweb',
          'rst',
          'tex',
          'text',
          'typst',
          'xhtml',
        },
        root_markers = { '.git' },
        get_language_id = function(_, filetype)
          return language_id_mapping[filetype] or filetype
        end,
        settings = {
          ltex = {
            enabled = {
              'bib',
              'context',
              'gitcommit',
              'html',
              'markdown',
              'org',
              'pandoc',
              'plaintex',
              'quarto',
              'mail',
              'mdx',
              'rmd',
              'rnoweb',
              'rst',
              'tex',
              'latex',
              'text',
              'typst',
              'xhtml',
            },
          },
        },
      })
      vim.lsp.enable('ltex_plus')
    end,
  }
}
