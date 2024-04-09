local dapui = require("dapui")
local dap = require("dap")
local ts = require("telescope.builtin")

local map = vim.keymap.set

map('v', '<', "<gv")
map('v', '>', ">gv")
map('v', 'J', ":m '+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('i', "<C-s>", vim.lsp.buf.signature_help)
map('n', 'K', vim.lsp.buf.hover)
map('n', "<leader>ca", vim.lsp.buf.code_action)
map('n', "<leader>rn", vim.lsp.buf.rename)

map('n', "<leader>bx", vim.cmd.Bdelete)
map('n', "<leader>bn", vim.cmd.enew)
map('n', "<Tab>", vim.cmd.bnext)
map('n', "<S-Tab>", vim.cmd.bprev)

map('n', "<leader>ng", function()
    return vim.cmd.Neoconf("global")
end)

map('n', "<leader>ff", ts.find_files)
map('n', "<leader>fg", ts.live_grep)

map('n', 'H', vim.cmd.HopChar2)

map('n', "<leader>dt", dapui.toggle)
map('n', "<leader>db", dap.toggle_breakpoint)
map('n', "<leader>dc", dap.continue)
map('n', "<leader>do", dap.step_over)
map('n', "<leader>di", dap.step_into)
map('n', "<leader>dr", dap.repl.open)
