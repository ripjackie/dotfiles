return {
  "rachartier/tiny-inline-diagnostic.nvim",
  opts = {},
  config = function(_, opts)
    require('tiny-inline-diagnostic').setup(opts)
    vim.diagnostic.config({ virtual_text = false })
  end
}
