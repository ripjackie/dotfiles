local M = {}

local mconfigs = require("plugins.configs.mason")
local handlers = require("custom.configs.handlers")


M.neodev = {
  library = {
    enabled = true,
    types = true,
    runtime = true,
    plugins = true
  }
}

M.mason = {
  ui = mconfigs.ui,
  PATH = mconfigs.PATH, max_concurrent_installers = mconfigs.max_concurrent_installers,
  ensure_installed = nil
}

M.lspconfig = {
  ensure_installed = {
    -- lua
    "lua_ls",
    -- go
    "gopls",
    -- python
    "pyright",
  },
  handlers = {
    handlers.default_lsp,
    lua_ls = handlers.lua_ls,
    gopls = handlers.gopls
  }
}

M.null_ls = {
  ensure_installed = {
    -- lua
    "selene",
    "stylua",
    -- go
    "gofumpt",
    "goimports_reviser",
    "golines",
    -- python
    -- "ruff",
    "ruff_format",
    "pylint"
  },
  handlers = {
    handlers.default_null_ls,
    ruff_format = handlers.ruff_lint
  }
}

M.dap = {
  ensure_installed = {
    -- go
    "delve"
  },
  handlers = {}
}

return M
