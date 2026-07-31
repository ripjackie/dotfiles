local vim = vim
local opt = vim.opt
-- Options
if vim.fn.has("termguicolors") then opt.termguicolors = true end
opt.background = "dark"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true -- false so treesitter works
opt.smartindent = false

opt.clipboard = "unnamedplus"

opt.splitbelow = true
opt.splitright = true
opt.autochdir = false

opt.showmode = false
opt.wrap = false
opt.syntax = "no"

opt.signcolumn = "yes:1"
opt.numberwidth = 2
opt.number = true
opt.relativenumber = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undofile"
opt.swapfile = false

opt.scrolloff = 12
opt.sidescrolloff = 16
opt.cursorline = true

opt.foldlevel = 4
