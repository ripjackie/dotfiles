local vim = vim
require("neodev").setup({})
require("neoconf").setup({})
require("lsp-setup").setup({
  servers = {
    lua_ls = {},
    ruff_lsp = {},
    clangd = {},
    jsonls = {}
  },
  on_attach = function(client)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.lsp.buf.format({ async = false })
        end
      })
    end
  end,
  default_mappings = false
})
