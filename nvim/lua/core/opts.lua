local opt = vim.opt

opt.termguicolors = true
opt.background = "dark"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

opt.splitbelow = true
opt.splitright = true

opt.showmode = false
opt.wrap = false

opt.signcolumn = "yes:1"
opt.numberwidth = 3
opt.number = true
opt.relativenumber = false

opt.hlsearch = false
opt.incsearch = true
-- opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undofile"
opt.swapfile = false

opt.scrolloff = 8
opt.sidescrolloff = 8

