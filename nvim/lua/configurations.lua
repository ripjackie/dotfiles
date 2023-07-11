local opt = vim.opt

opt.tabstop = 4 -- number of columns per tab
opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> does the right thing
opt.shiftwidth = 4 -- width for autoindents
opt.expandtab = true -- convert tabs to white space
opt.smarttab = true
opt.compatible = false -- disable vi compatibility
opt.showmatch = true -- show matching
opt.ignorecase = true -- case insensitive
opt.hlsearch = true -- highlight search
opt.incsearch = true -- incremental search
opt.number = true -- show line numbers
opt.cc = "80" -- set column border for coding style
opt.syntax = "on" -- enable syntax highlighting
opt.mouse = "a" -- enable mouse 
opt.clipboard = "unnamedplus" -- use system clipboard
opt.cursorline = true -- highlight current cursorline
opt.signcolumn = "yes" -- gutter always enabled
opt.termguicolors = true
opt.list = true
opt.wrap = false -- disable linewrap

-- vim.fn.sign_define(
--     "DiagnosticSignError",
--     {text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError"}
-- )
-- vim.fn.sign_define(
--     "DiagnosticSignWarn",
--     {text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn"}
-- )
-- vim.fn.sign_define(
--     "DiagnosticSignHint",
--     {text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint"}
-- )
-- vim.fn.sign_define(
--     "DiagnosticSignInfo",
--     {text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo"}
-- )
