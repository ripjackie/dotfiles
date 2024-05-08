local vim = vim

require("core.lazy")
require("core.opts")
require("core.autocmds")
require("core.keymaps")

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.themes" }
}, {
  install = {
    colorscheme = { "habamax" }
  },
})

vim.cmd.colorscheme("forestbones")
