-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- check for vscode
if not vim.g.vscode then
    -- all plugins
    require("plugins")
    -- all plugin configurations
    require("configs")
    -- setting keymaps
    require("keymaps")
    -- nvim-cmp configurations
    require("nvim_cmp_config")
    -- nvim's lsp configs
    require("lspconfigs")
    -- evil lualine theme for lualine
    -- require("evil_lualine")
end
