local vim = vim
local opt = vim.opt

vim.g.mapleader = " "

opt.tabstop = 4     -- number of columns per tab
opt.softtabstop = 4 -- see multiple spaces as \t so <BS> works properly
opt.shiftwidth = 4     -- width for autoindents

opt.expandtab = true -- convert tabs to whitespace
opt.smarttab = true    --

opt.showmatch = true   -- show matching
opt.ignorecase = true  -- show matching

opt.hlsearch = true    -- highlight search
opt.incsearch = true   -- incremental search

opt.number = true      -- show line numbers

opt.mouse = "a"        -- enable mouse support
opt.cursorline = true  -- highlight current cursorline
opt.signcolumn = "yes" -- always enable gutter
opt.wrap = false       -- disable linewrap
opt.swapfile = false   -- disable swapfile

if vim.fn.has("termguicolors") then
    opt.termguicolors = true
end

opt.background = "dark"
vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1

vim.g.coq_settings = { auto_start = "shut-up" }
