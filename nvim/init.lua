local vim = vim
local opt = vim.o

if vim.g.vscode then
  return
end

vim.loader.enable()

--[[ ==== Helpers ==== ]]--
local function map(mode, lhs, rhs, opts)
  local default_opts = { silent = true }
  if opts == nil then
    vim.keymap.set(mode, lhs, rhs, default_opts)
  else
    vim.tbl_extend("keep", opts, default_opts)
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

--[[ === === Globals ==== ==== ]]--
vim.g.mapleader = " "

--[[ ==== ==== Options ==== ==== ]]--
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

--[[ ==== ==== Keymaps ==== ==== ]]--

-- Movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
-- map("v", "J", ":m '>+1<CR>gv=gv")
-- map("v", "K", ":m '<-2<CR>gv=gv")

-- LSP
map("n", "<leader>gd", vim.lsp.buf.declaration)
map("n", "<leader>gD", vim.lsp.buf.definition)
map("n", "<leader>gt", vim.lsp.buf.type_definition)
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>s", "<cmd>source<cr>")

map("n", "-", "<cmd>Oil<cr>")

-- Buffers
map("n", "<leader>x", "<cmd>BufferClose<cr>")
map("n", ",", "<cmd>BufferPrevious<cr>")
map("n", ".", "<cmd>BufferNext<cr>")
map("n", "<", "<cmd>BufferMovePrevious<cr>")
map("n", ">", "<cmd>BufferMoveNext<cr>")
