local map = vim.keymap.set

map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>x", "<cmd>bdelete<cr>")
map("n", "<leader>n", "<cmd>enew<cr>")
map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprev<cr>")

-- map("n", "-", "<cmd>Explore<cr>")
map("n", "-", "<cmd>Neotree filesystem reveal_force_cwd current toggle<CR>")

map("n", "<leader>th", "<cmd>Themery<cr>")
<<<<<<< HEAD:nvim-windows/lua/core/keymaps.lua
map('n', 's', "<Plug>(leap-forward)")
map('n', 'S', "<Plug>(leap-backward)")
map('n', 'gs', "<Plug>(leap-from-window)")

=======

map("n", "S", "<Plug>(leap-backward)")
map("n", "s", "<Plug>(leap-forward)")
map("n", "gs", "<Plug>(leap-from-window)")
>>>>>>> refs/remotes/origin/main:win/lua/core/keymaps.lua
