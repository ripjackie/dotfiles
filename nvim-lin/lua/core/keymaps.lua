local dapui = require("dapui")
local dap = require("dap")
local ts = require("telescope.builtin")

local map = vim.keymap.set

vim.g.mapleader = ' '

map('v', '<', "<gv")
map('v', '>', ">gv")
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', 'K', vim.lsp.buf.hover)
map('i', "<C-s>", vim.lsp.buf.signature_help)
map('n', "<leader>ca", vim.lsp.buf.code_action)
map('n', "<leader>rn", vim.lsp.buf.rename)

map('n', "<leader>bd", vim.cmd.bdelete)
map('n', "<leader>x", vim.cmd.bdelete)
map('n', "<leader>bn", vim.cmd.enew)
map('n', "<Tab>", vim.cmd.bnext)
map('n', "<S-Tab>", vim.cmd.bprev)

-- map('t', "<Tab>", "<C-Bslash><C-n><cmd>bnext<cr>")
-- map('t', "<S-Tab>", "<C-Bslash><C-n><cmd>bprev<cr>")
map('t', '<Esc>', "<C-Bslash><c-n>")

map('n', "<leader>ng", function()
  return vim.cmd.Neoconf("global")
end)

map('n', 's', "<Plug>(leap)")
map('n', 'S', "<Plug>(leap-from-window)")
map({ 'x', 'o' }, 's', "<Plug>(leap-forward)")
map({ 'x', 'o' }, 'S', "<Plug>(leap-backward)")

map('n', "<leader>ff", ts.find_files)
map('n', "<leader>fg", ts.live_grep)

map('n', "<leader>dt", dapui.toggle)
map('n', "<leader>db", dap.toggle_breakpoint)
map('n', "<leader>dc", dap.continue)
map('n', "<leader>do", dap.step_over)
map('n', "<leader>di", dap.step_into)
map('n', "<leader>dr", dap.repl.open)

map('n', "gd", vim.lsp.buf.declaration)
map('n', "gD", vim.lsp.buf.definition)

map('n', '-', function() vim.cmd.Neotree({ "filesystem", "reveal_force_cwd", "current", "toggle" }) end)
