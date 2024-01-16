local opt = vim.opt

opt.termguicolors = true

opt.tabstop 	= 4
opt.softtabstop = 4
opt.shiftwidth 	= 4
opt.expandtab 	= true
opt.smarttab 	= true
opt.autoindent = true
opt.splitbelow = true
opt.splitright = true

opt.wrap 		= false
opt.hlsearch = false
opt.incsearch = true
opt.number = true
opt.cursorline = true
opt.showmatch = true
opt.ignorecase = true
opt.scrolloff = 1
opt.sidescrolloff = 2
opt.backspace = { "indent", "start", "eol" }

opt.undofile = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.swapfile = false
opt.ruler = false
opt.signcolumn = "yes"
opt.scrolloff = 8
