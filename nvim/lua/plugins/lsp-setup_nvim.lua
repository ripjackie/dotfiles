return {
  "junnplus/lsp-setup.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  opts = {
    on_attach = function(client, bufnr)
      if client.supports_method('textDocument/formatting') then
        local augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, async = false })
          end
        })
      end
    end,
    servers = {
      lua_ls = {},
      ruff_lsp = {}
    }
  }
}
