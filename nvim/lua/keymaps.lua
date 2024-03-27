local vim = vim

vim.g.mapleader = " "
vim.keymap.set('n', '<C-n>', "<cmd>Neotree toggle<cr>")
vim.keymap.set('n', '<leader>x', "<cmd>bdelete<cr>")
vim.keymap.set('n', '<Tab>', "<cmd>bnext<cr>")
vim.keymap.set('n', '<S-Tab>', "<cmd>bprevious<cr>")
vim.keymap.set('n', '<leader>th', "<cmd>Themery<cr>")
