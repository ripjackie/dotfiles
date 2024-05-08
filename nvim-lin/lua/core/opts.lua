local opt = vim.opt

if vim.fn.has("termguicolors") then
  opt.termguicolors = true
end

opt.background = "dark"
opt.clipboard:append("unnamedplus")
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
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.numberwidth = 3
opt.relativenumber = true
opt.number = true
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undofile"
opt.swapfile = false
opt.scrolloff = 8
opt.sidescrolloff = 8
