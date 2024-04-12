local function on_attach(client)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(ev)
        vim.lsp.buf.format({ bufnr = ev.buf, async = false })
      end
    })
  end
end

require("neoconf").setup({})
require("neodev").setup({})
require("lsp-setup").setup({
  servers = {
    lua_ls = {},
    jsonls = {},
    clangd = {},
    ruff_lsp = {}
  },
  on_attach = on_attach,
  default_mappings = false
})
