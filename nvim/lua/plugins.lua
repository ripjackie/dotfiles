local plugins = {
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {
      tabout = { enable = true }
    }
  },
  {
    "zaldih/themery.nvim",
    cmd = "Themery",
    dependencies = require("themery.themes"),
    opts = {
      themes = require("themery.configs"),
      themeConfigFile = "~/.config/nvim/lua/themery/theme.lua",
      livePreview = true
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      endwise = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "vim", "vimdoc", "markdown", "markdown_inline",
        "lua", "python", "go", "rust"
      }
    }
  },
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  {
    "folke/twilight.nvim",
    opts = {}
  }
}

return plugins
