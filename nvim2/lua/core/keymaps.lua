local map = vim.keymap.set

map('v', '<', "<gv")
map('v', '>', ">gv")
map('v', 'J', ":m '+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('i', "<C-s>", vim.lsp.buf.signature_help)
map('n', 'K', vim.lsp.buf.hover)
map('n', "<leader>ca", vim.lsp.buf.code_action)
map('n', "<leader>rn", vim.lsp.buf.rename)

map('n', "<leader>bd", vim.cmd.bdelete)
map('n', "<leader>bn", vim.cmd.enew)
map('n', "<Tab>", vim.cmd.bnext)
map('n', "<S-Tab>", vim.cmd.bprev)
