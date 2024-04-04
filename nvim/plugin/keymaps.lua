local vim = vim

vim.keymap.set('n', "<leader>bd", vim.cmd.Bdelete)
vim.keymap.set('n', "<leader>bn", vim.cmd.enew)
vim.keymap.set('n', "<Tab>", vim.cmd.bnext)
vim.keymap.set('n', "<S-Tab>", vim.cmd.bprev)
vim.keymap.set('n', "<leader>c", function() vim.cmd.Neoconf({ "global" }) end)
vim.keymap.set('n', "<C-n>", function() vim.cmd.Neotree({ "toggle", "right", "reveal" }) end)

vim.keymap.set('v', '>', "<gv")
vim.keymap.set('v', '<', ">gv")
