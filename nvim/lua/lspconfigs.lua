neodev = require("neodev")
lsp_setup = require("lsp-setup")

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
                        checkThirdParty = false
                    },
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        }
    }
})
