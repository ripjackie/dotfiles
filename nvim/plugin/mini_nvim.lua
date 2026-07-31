vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim"
})

require("mini.bufremove").setup()

-- require('mini.pairs').setup({
--   mappings = {
--     ['('] = false,
--     ['['] = false,
--     ['{'] = false
--   },
-- })
require("mini.move").setup({
  mappings = {
    left = "<S-Tab>",
    right = "<Tab>",
    down = "J",
    up = "K"
  }
})
