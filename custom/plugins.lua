-- spec:
-- [1]
-- enabled
-- {version, branch, tag}
-- lazy
-- {event, cmd, ft}
-- dependencies
-- init
-- opts
-- config

local vim = vim

local plugins = {

  -- Plugin Replacements
  {
    "windwp/nvim-autopairs",
    enabled = false
  },

  {
    "altermo/ultimate-autopair.nvim",
    lazy = true,
    event = "InsertEnter",
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    init = function() end,
    config = function() end,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "nvimtools/none-ls.nvim",
    },

    opts = require("custom.configs.mason"),

    config = function(_, opts)
      require("neodev").setup(opts.neodev)
      require("null-ls").setup()

      require("mason").setup(opts.mason)
      require("mason-lspconfig").setup(opts.lspconfig)
      require("mason-null-ls").setup(opts.null_ls)
      require("mason-nvim-dap").setup(opts.dap)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    init = function ()
      require("core.utils").load_mappings("neotree")
    end,
    opts = {
      close_if_last_window = true,

    }
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
    "m-demare/hlargs.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "2.1.x",
    lazy = true,
    event = "InsertEnter",
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
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    opts = {
      cmdline = {
        view = "cmdline"
      },
      popupmenu = {
        backend = "cmp"
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true
        }
      },
      presets = {
        long_message_to_split = true
      }
    }
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
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
    init = function() end,
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

}

return plugins
