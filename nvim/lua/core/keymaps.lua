local vim = vim

---@param mode table | string
---@param lhs string
---@param rhs string | function
---@param opts nil | table
local function map(mode, lhs, rhs, opts)
  local default_opts = { silent = true }
  vim.tbl_extend("keep", opts or {}, default_opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Keymaps
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>gd", vim.lsp.buf.declaration)
map("n", "<leader>gD", vim.lsp.buf.definition)
map("n", "<leader>gt", vim.lsp.buf.type_definition)

map("n", "<leader>e", vim.diagnostic.open_float)
map('n', "<leader>ca", require("tiny-code-action").code_action)
map('n', "K", require("pretty_hover").hover)
map('n', "<leader>rn", vim.lsp.buf.rename)
map('n', "<leader>q", "<cmd>Trouble diagnostics toggle focus=true<cr>")
map('n', "<leader>v", "<cmd>NvimTreeToggle<cr>")

map('n', "<C-h>", "<C-w>h")
map('n', "<C-j>", "<C-w>j")
map('n', "<C-k>", "<C-w>k")
map('n', "<C-l>", "<C-w>l")

map('n', "<leader>x", "<cmd>BufferClose<cr>")
map('n', ",", "<cmd>BufferPrevious<cr>")
map('n', ".", "<cmd>BufferNext<cr>")
map('n', "<", "<cmd>BufferMovePrevious<cr>")
map('n', ">", "<cmd>BufferMoveNext<cr>")

map('t', "<Esc>", "<C-\\><C-n>")

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.live_grep)
map("n", "<leader>fb", builtin.buffers)
map("n", "<leader>fh", builtin.help_tags)
