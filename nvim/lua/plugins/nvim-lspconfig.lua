local vim = vim
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "saghen/blink.cmp",
      "artemave/workspace-diagnostics.nvim"
    },
    opts = {
      servers = {
        lua_ls = {},
        jsonls = {},
        basedpyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true
            },
            python = {
              analysis = {
                ignore = { "*" }
              }
            }
          }
        },
        -- csharp_ls = {},
        ruff = {
          init_options = {
            configuration = {
              lint = {
                preview = true,
                select = { "FAST", "ASYNC", "B", "A", "COM", "DTZ", "FIX", "FA", "ICN", "PYI", "SIM", "SLOT", "TID", "TC", "PTH", "N" }
              },
              format = {
                ['quote-style'] = 'single',
                ['indent-style'] = 'space',
              }
            }
          }
        },
        clangd = {},
        cmake = {},
        gopls = {},
        mesonlsp = {}
      }
    },
    config = function(_, opts)
      require("mason").setup()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then return end
          if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
          require("workspace-diagnostics").populate_workspace_diagnostics(client, args.buf)
          if client:supports_method("textDocument/formatting") then
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
      -- local lspconfig = require("lspconfig")
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        -- lspconfig[server].setup(config)
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  }
}
