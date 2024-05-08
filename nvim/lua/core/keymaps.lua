local opt = vim.opt
local map = vim.keymap.set

vim.g.mapleader = " "

map('n', "<leader>rl", function()
    opt.relativenumber = not opt.relativenumber:get()
end)

map('v', '<', "<gv")
map('v', '>', ">gv")
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '-', "<cmd>Explore<cr>")

map('n', '<Tab>', "<cmd>bnext<cr>")
map('n', '<S-Tab>', "<cmd>bprev<cr>")
map('i', 'jk', '<Esc>')
