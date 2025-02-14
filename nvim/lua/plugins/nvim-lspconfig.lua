return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    opts = {
      servers = {
        lua_ls = {},
        jsonls = {},
        basedpyright = {},
        csharp_ls = {},
        clangd = {
          cmd = { "clangd-19" }
        },
        cmake = {}
      }
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = args.buf,
                  id = client.id,
                  async = false
                })
              end
            })
          end
        end
      })
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for server, config in pairs(opts.servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
    end
  }
}
