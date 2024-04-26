local map = vim.keymap.set

map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>x", "<cmd>bdelete<cr>")
map("n", "<leader>n", "<cmd>enew<cr>")
map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprev<cr>")

map("n", "-", "<cmd>Explore<cr>")

map("n", "<leader>th", "<cmd>Themery<cr>")
