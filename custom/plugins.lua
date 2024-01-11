local vim = vim

local plugins = {

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
    init = function() end,
    config = function() end,
  },

  -- Custom Plugins

  {
    "mfussenegger/nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function()
      -- return require("custom.configs.null-ls")
    end,
  },

  {
    "utilyre/barbecue.nvim",
    lazy = true,
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {}
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
    "lukas-reineke/indent-blankline.nvim",
    version = "3.5.x",
    lazy = true,
    event = "BufEnter",
    init = function() end,
    config = function(_, opts)
      require("ibl").setup({})
    end,
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

  -- Overrides
  {
    "nvim-treesitter/nvim-treesitter",
    init = function() end,
    lazy = false,
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
        "go", "python",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },

    opts = require("custom.configs.mason"),

    config = function(_, opts)
      require("mason").setup(opts.mason)
      require("neodev").setup(opts.neodev)
      require("mason-lspconfig").setup(opts.lspconfig)
      require("mason-null-ls").setup(opts.null_ls)
      require("mason-nvim-dap").setup(opts.dap)
    end,
  },
}

return plugins
