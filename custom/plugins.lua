local plugins = {

  -- Overrides
  {
    "williamboman/mason.nvim",
    opts = function()
      local opts = require "plugins.configs.mason"
      opts.ensure_installed = {
        -- lua
        "lua-language-server",
        "selene",
        "stylua",
        -- go
        "gopls",
        "golangci-lint",
        "gofumpt",
        "goimports-reviser",
        -- python
        "python-lsp-server",
        "pyright",
      }
      return opts
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
    opts = {
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      endwise = { enable = true },
      ensure_installed = {
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "go",
        "python",
      },
    },
  },

  -- Plugin Replacements

  {
    "altermo/ultimate-autopair.nvim",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      { "windwp/nvim-autopairs", enabled = false },
    },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "junnplus/lsp-setup.nvim",
        dependencies = {
          "folke/neodev.nvim",
        },
        config = function()
          require "custom.configs.lsp-setup"
        end,
      },
    },
    config = function() end,
  },

  -- Custom Plugins

  {
    "nvimtools/none-ls.nvim",
    ft = { "go", "lua", "python" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "utilyre/barbecue.nvim",
    lazy = true,
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
      "Nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "LspAttach",
    tag = "v1.1.0",
    opts = {},
  },

  {
    "m-demare/hlargs.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    lazy = true,
    event = "InsertEnter",
    version = "*",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}

return plugins
