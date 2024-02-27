local M = {}

M.hop = {
  n = {
    ["<leader>h"] = { "<cmd>HopWord<CR>", "Hop Word" }
  }
}

M.neotree = {
  n = {
    ["<C-n>"] = { "<cmd>Neotree toggle=true<CR>", "Toggle Neotree" },
    ["<leader>e"] = { "<cmd>Neotree<CR>", "Open & Focus Neotree" }
  }
}

return M
