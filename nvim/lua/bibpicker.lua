local M = {}

local fzf = require("fzf-lua")

-- find project root (uses LSP, falls back to cwd)
local function get_root()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    if client.config.root_dir then
      return client.config.root_dir
    end
  end
  return vim.fn.getcwd()
end

-- find the first .bib file in root
local function find_bibfile(root)
  local bibs = vim.fn.globpath(root, "*.bib", false, true)
  return bibs[1]
end

-- extract bibkeys using ripgrep
local function get_bibkeys(bibfile)
  local cmd = {
    "rg",
    "--no-heading",
    "--color=never",
    "^@\\w+\\{[^,]+",
    bibfile,
  }

  local lines = vim.fn.systemlist(cmd)

  local keys = {}
  for _, line in ipairs(lines) do
    local key = line:match("^@%w+%{([^,]+)")
    if key then
      table.insert(keys, key)
    end
  end

  return keys
end

function M.pick_bibkey()
  local root = get_root()
  local bibfile = find_bibfile(root)

  if not bibfile then
    vim.notify("No .bib file found in project root", vim.log.levels.WARN)
    return
  end

  local keys = get_bibkeys(bibfile)
  if vim.tbl_isempty(keys) then
    vim.notify("No bibkeys found in " .. bibfile, vim.log.levels.WARN)
    return
  end

  fzf.fzf_exec(keys, {
    prompt = "BibTeX ❯ ",
    actions = {
      ["default"] = function(selected)
        local key = selected[1]
        vim.api.nvim_put({ key }, "c", true, true)
      end,
    },
  })
end

return M
