if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua", "vim", "nix", "make", "regex", 
      "python", "java",
      "csv", "json", "tsv", "yaml", 
      "c", "cpp",
      "sql",
      "latex", "bibtex",
      "git_rebase", "git_config", "gitattributes", "gitcommit", "gitignore",
      "javascript", "html", "css"
      -- add more arguments for adding more treesitter parsers
    },
  },
}
