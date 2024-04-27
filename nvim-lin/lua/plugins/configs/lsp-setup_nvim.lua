require("mason").setup({})
require("neodev").setup({})
require("neoconf").setup({})
require("lsp-setup").setup({
  servers = {
    lua_ls = {},
    clangd = {},
    jsonls = {},
    pyright = {},
    cmake = {}
  },
  default_mappings = false,
  on_attach = function(client)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(ev)
          vim.lsp.buf.format({ bufnr = ev.buf, async = false })
        end
      })
    end
  end
})
