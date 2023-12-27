local vim = vim
local opt = vim.opt

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    })
end
opt.rtp:prepend(lazypath)

vim.g.mapleader   = " "

opt.tabstop       = 4
opt.softtabstop   = 4
opt.shiftwidth    = 4
opt.expandtab     = true

opt.hlsearch      = false
opt.incsearch     = true

opt.number        = true
opt.cursorline    = true
opt.signcolumn    = "yes"

opt.wrap          = false
opt.swapfile      = false
opt.background    = "dark"

opt.termguicolors = true

local lazy        = require("lazy")

lazy.setup("plugins")
require("configs.maps")
