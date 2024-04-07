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

require("neodev").setup({})
require("neoconf").setup({})
require("mason").setup({})
require("lsp-setup").setup({
  servers = {
    lua_ls = {},
    jsonls = {},
    clangd = {},
    ruff_lsp = {}
  },
  on_attach = on_attach
})
