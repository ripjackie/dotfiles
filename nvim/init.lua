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

-- Neovim Opt Configs
require("nvim-optconfigs")
-- Lazy.nvim Plugin Manager
require("lazy").setup("plugins")
-- Neovim Keymappings Using nest Plugin
require("nvim-keymaps")
-- Neovim LSP Configs
require("nvim-lspconfigs")
-- nvim-cmp Configs
require("nvim-cmpconfigs")
