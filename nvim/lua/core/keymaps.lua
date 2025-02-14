local vim = vim

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

map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprevious<cr>")
map("n", "<leader>x", "<cmd>bdelete<cr>")
map("n", "<leader>d", vim.lsp.buf.declaration)
map("n", "<leader>D", vim.lsp.buf.definition)
map("n", "<leader>T", vim.lsp.buf.type_definition)

map('n', "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map('n', "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map('n', '-', "<cmd>Telescope file_browser<cr>")

map("n", "<leader>e", vim.diagnostic.open_float)
map('n', "<leader>ca", "<cmd>Lspsaga code_action<cr>")
map('n', "K", "<cmd>Lspsaga hover_doc<cr>")
map('n', "<leader>rn", "<cmd>Lspsaga rename<cr>")
