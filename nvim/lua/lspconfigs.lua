local neodev = require("neodev")
local lsp_setup = require("lsp-setup")

neodev.setup({})
lsp_setup.setup({
    servers = {
        pyright = {},
        lemminx = {
            settings = {
                xml = {
                    server = {
                        workDir = "~/.cache/lemminx"
                    }
                }
            }
        },
        lua_ls = {
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                        maxPreload = 10000,
                        preloadFileSize = 1000
                    },
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        }
    }
})
