local vim = vim
require("neodev").setup({})
require("neoconf").setup({})
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function on_attach(client)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end
    })
  end
end
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.ruff_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities
})
