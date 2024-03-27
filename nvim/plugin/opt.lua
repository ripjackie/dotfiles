local vim = vim
local opt = vim.opt

opt.termguicolors = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true

opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.number = true
opt.showmatch = true
opt.ignorecase = true
opt.sidescrolloff = 8
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undofile"
opt.swapfile = false
opt.signcolumn = "yes"
opt.scrolloff = 8
