local lsp = require("lspconfig")
local coq = require("coq")

lsp.pyright.setup(coq.lsp_ensure_capabilities {})
lsp.lua_ls.setup(
    coq.lsp_ensure_capabilities {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = {"vim"},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            }
        }
    }
)
