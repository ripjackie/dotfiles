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

-- map("n", "<leader>gd", vim.lsp.buf.declaration)
-- map("n", "<leader>gD", vim.lsp.buf.definition)
-- map("n", "<leader>gt", vim.lsp.buf.type_definition)
-- map("n", "<leader>e", vim.diagnostic.open_float)
-- map('n', "<leader>ca", vim.lsp.buf.code_action)
-- map('n', "K", vim.lsp.buf.hover)
-- map('n', "<leader>rn", vim.lsp.buf.rename)
map('n', "<leader>gr", "<cmd>LspUI reference<CR>")
map('n', "<leader>gd", "<cmd>LspUI definition<CR>")
map('n', "<leader>gt", "<cmd>LspUI type_definition<CR>")
map('n', "<leader>gD", "<cmd>LspUI declaration<CR>")
map('n', "<leader>rn", "<cmd>LspUI rename<CR>")
map('n', "<leader>ca", "<cmd>LspUI code_action<CR>")
map('n', "<leader>e", "<cmd>LspUI diagnostic next<CR>")

map('n', "<leader>q", "<cmd>Trouble diagnostics toggle focus=true<cr>")
-- map('n', "<leader><S-v>", "<cmd>NvimTreeToggle<cr>")
map('n', "<leader>v", "<cmd>CHADopen<cr>")

map('n', "<leader>o", "<CMD>Outline<CR>")

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
map('t', "<C-h>", "<C-\\><C-n><C-w>h")
map('t', "<C-j>", "<C-\\><C-n><C-w>j")
map('t', "<C-k>", "<C-\\><C-n><C-w>k")
map('t', "<C-l>", "<C-\\><C-n><C-w>l")

map({ 'n', 'v' }, "<F3>", "<cmd>DapViewToggle<cr>")
map({ 'n', 'v' }, "<F4>", require('dap').pause)
map({ 'n', 'v' }, "<F5>", require('dap').continue)
map({ 'n', 'v' }, "<F6>", require('dap').step_into)
map({ 'n', 'v' }, "<F7>", require('dap').step_over)
map({ 'n', 'v' }, "<F8>", require('dap').step_out)
map({ 'n', 'v' }, "<F9>", require('dap').terminate)
map({ 'n', 'v' }, "<leader>db", require("dap").toggle_breakpoint)


local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.live_grep)
map("n", "<leader>fb", builtin.buffers)
map("n", "<leader>fh", builtin.help_tags)


map("n", "<leader>c", function()
  vim.ui.input({}, function(c)
    if c and c ~= "" then
      vim.cmd("vnew")
      vim.bo.buftype = "nofile"
      vim.bo.bufhidden = "wipe"
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
    end
  end)
end)
