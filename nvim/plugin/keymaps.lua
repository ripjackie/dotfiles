local vim = vim

local map = vim.keymap.set

map('n', "<leader>bd", vim.cmd.Bdelete)
map('n', "<leader>bn", vim.cmd.enew)
map('n', "<Tab>", vim.cmd.bnext)
map('n', "<S-Tab>", vim.cmd.bprev)
map('n', "<leader>c", function()
  vim.cmd.Neoconf({ "global" })
end)
map('n', "<C-n>", function()
  vim.cmd.Neotree({ "toggle", "right", "reveal", "reveal_force_cwd" })
end)
map('v', '>', ">gv")
map('v', '<', "<gv")
map('n', 'K', "<cmd>LspUI hover<cr>")
