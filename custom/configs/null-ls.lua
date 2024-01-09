local vim = vim

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local fmt = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local on_attach = function (client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function ()
        vim.lsp.buf.format({ async = false, bufnr = bufnr })
      end
    })
  end
end

local opts = {
  on_attach = on_attach,
  sources = {
    -- lua
    lint.selene,
    fmt.stylua,
    -- go
    lint.golangci_lint,
    fmt.gofumpt,
    fmt.goimports_reviser,
    fmt.golines
  }
}

return opts
