local vim = vim

local plugins = {
  -- Overrides

  {
    "nvim-treesitter/nvim-treesitter",
    init = function() end,
    cmd = nil,
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
        "go",
        "python",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason").opts,
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
          require("custom.configs.lsp-setup")
        end,
      },
    },
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
    ft = { "go", "lua", "python" },
    opts = function()
      return require("custom.configs.null-ls")
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
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
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
    init = function() end,
    opts = {},
    config = function(_, opts)
      require("ibl").setup(opts)
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
}

return plugins
