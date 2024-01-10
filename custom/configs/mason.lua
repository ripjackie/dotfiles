local M = {}

M.opts = require("plugins.configs.mason")

M.opts.ensure_installed = {
  -- lua
  "lua-language-server",
  "selene",
  "stylua",
  -- go
  "gopls",
  "golangci-lint",
  "gofumpt",
  "goimports-reviser",
  "golines",
  -- python
  "python-lsp-server",
  "pyright",
}

return M
