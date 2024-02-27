local vim = vim
return {
  -- Overrides
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise"
    },
    opts = {
      ensure_installed = { "lua", "python", "vim", "vimdoc", "bash" },
      endwise = { enable = true }
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "3.x.x",
    event = "BufEnter",
    config = function()
      require("ibl").setup({})
    end,
  },

  -- Replacements
  {
    "windwp/nvim-autopairs",
    enabled = false
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {
      bs = {
        space = "balance",
        indent_ignore = true,
        single_delete = true
      },
      cr = { autoclose = true },
      space2 = { enable = true },
      tabout = { enable = true }
    }
  },

  {
    "neovim/nvim-lspconfig",
    config = function() end
  },
  {
    "junnplus/lsp-setup.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    opts = require("custom.lsp_setup")
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        group_empty_dirs = true,
        use_libuv_file_watcher = true
      }
    }
  },

  -- Standard
  {
    "jay-babu/mason-null-ls.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim"
    },
    opts = {
      ensure_installed = {
        -- lua
        "selene"
      },
      handlers = {}
    }
  },

  {
    "hadronized/hop.nvim",
    cmd = { "HopWord" },
    branch = "v2",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "hop")
      require("hop").setup(opts)
    end,
    opts = {}
  },

  {
    "jinzhongjia/LspUI.nvim",
    lazy = false,
    branch = "main",
    opts = {}
  }

}
