local M = {}
function M.on_attach(client, bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false, bufnr = bufnr })
      end
    })
  end
end

M.inlay_hints = { enable = true }

M.capabilities = require("plugins.configs.lspconfig").capabilities

M.default_mappings = false

M.servers = {
  pyright = {},
  ruff_lsp = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        runtime = {
          version = { "LuaJIT" }
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            [vim.fn.stdpath("config") .. "/lua/custom/lua_addons/luvit/library"] = true
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
          userThirdParty = {
            vim.fn.stdpath("config") .. "/lua/custom/lua_addons"
          }
        }
      }
    }
  }
}

return M
