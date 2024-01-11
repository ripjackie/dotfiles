local M = {}

M.neotree = {
  plugin = true,
  n = {
    ["<C-n>"] = {"<cmd> Neotree toggle reveal <CR>"},
    ["<leader>e"] = {"<cmd> Neotree reveal <CR>"},
  }
}

return M
