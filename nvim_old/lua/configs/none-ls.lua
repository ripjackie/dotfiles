local opts = {}
local vim = vim
local null_ls = require("null-ls")

local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local on_attach = require("configs.lsp-setup").on_attach

opts.on_attach = on_attach

opts.sources = {
    -- lua
    -- format.stylua,
    lint.selene,
    -- python
    format.ruff,
    lint.ruff,
    -- go
    lint.golangci_lint
}

return opts
