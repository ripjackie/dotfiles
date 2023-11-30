local lint = require("lint")

local ignore_filetypes = { 'neo-tree' }
local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

local focus_augroup =
    vim.api.nvim_create_augroup('FocusDisable', { clear = true })

local linter_augroup = vim.api.nvim_create_augroup("Linters", { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
    group = focus_augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
    group = focus_augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
        else
            vim.b.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for FileType',
})

-- Linters
lint.linters_by_ft = {
    lua = { 'luacheck', },
    python = { 'mypy', }
}
vim.api.nvim_create_autocmd("BufWrite", {
    group = linter_augroup,
    callback = function()
        lint.try_lint()
    end
})

-- Neo-tree on open
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local neo = require("neo-tree.command")
        neo.execute({ action = "show" })
    end
})
