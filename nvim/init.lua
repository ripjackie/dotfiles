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

-- vim.opt configs
local opt = vim.opt

vim.g.mapleader = " "
vim.g.loaded_perl_provider = 0
opt.termguicolors = true
opt.tabstop = 4               -- number of columns per tab
opt.softtabstop = 4           -- see multiple spaces as tabstops so <BS> does the right thing
opt.shiftwidth = 4            -- width for autoindents
opt.expandtab = true          -- convert tabs to white space
opt.smarttab = true
opt.compatible = false        -- disable vi compatibility
opt.showmatch = true          -- show matching
opt.ignorecase = true         -- case insensitive
opt.hlsearch = true           -- highlight search
opt.incsearch = true          -- incremental search
opt.number = true             -- show line numbers
opt.cc = "80"                 -- set column border for coding style
opt.syntax = "on"             -- enable syntax highlighting
opt.mouse = "a"               -- enable mouse
opt.clipboard = "unnamedplus" -- use system clipboard
opt.cursorline = true         -- highlight current cursorline
opt.signcolumn = "yes"        -- gutter always enabled
opt.list = true
opt.wrap = false              -- disable linewrap
opt.swapfile = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

if vim.fn.has("termguicolors") then
    opt.termguicolors = true
end

opt.background = "dark"
vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1

-- Lazy.nvim Plugin Manager
require("lazy").setup("plugins")
-- Neovim Keymappings Using nest Plugin
require("nvim-keymaps")
-- Neovim LSP Configs
require("nvim-lspconfigs")
-- nvim-cmp Configs
require("nvim-cmpconfigs")

vim.cmd.colorscheme("everforest")
