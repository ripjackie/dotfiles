return {
  "junnplus/lsp-setup.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
    "folke/neoconf.nvim"
  },
  config = function(_, opts)
    require("mason").setup({})
    require("neodev").setup({})
    require("neoconf").setup({})
    require("lsp-setup").setup(opts)
  end,
  opts = {
    servers = {
      lua_ls = {},
      clangd = {},
      jsonls = {},
      pyright = {}
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
  }
}
