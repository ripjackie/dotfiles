local opts = {}
local vim = vim

opts.inlay_hints = {
    enabled = true
}

opts.on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        local fmtgrp = vim.api.nvim_create_augroup("LspFormat", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = fmtgrp,
            callback = function()
                vim.lsp.buf.format({ async = false, bufnr = bufnr })
            end
        })
    end
end

opts.servers = {
    pyright = {},
    lua_ls = {
        settings = {
            Lua = {
                format = {
                    enable = true,
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "4",
                    },
                },
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim" },
                },
                hint = {
                    enable = true,
                    arrayIndex = "Auto",
                    await = true,
                    paramName = "All",
                    paramType = true,
                    semicolon = "SameLine",
                    setType = false,
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
                        [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                    },
                    maxPreload = 10000,
                    preloadFileSize = 1000,
                },
            },
        },
    },
}

require("plugins.neodev.configs")

require("lsp-setup").setup(opts)
