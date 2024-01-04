local M = {}

local vim = vim

local null_ls = require("null-ls")

local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local fmtgrp = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = fmtgrp, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = fmtgrp,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
end

M.sources = {
    --lua
    -- format.stylua,
    lint.selene,
    --python
    format.ruff,
    lint.ruff,
}

return M
