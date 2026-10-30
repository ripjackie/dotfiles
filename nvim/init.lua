vim.g.mapleader = " "

---@type PluginSpec[]
require("packa").setup({
  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin" },

  -- Basic Dependencies
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",

  -- Functionality
  { "stevearc/oil.nvim",
    config = function()
      return require("oil").setup()
    end
  },
  "https://codeberg.org/andyg/leap.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  { "nvim-telescope/telescope.nvim",
    version = "*",
    config = function()
      return require("telescope").setup()
    end
  },
  -- "qwavies/smart-backspace.nvim",

  -- Completion
  { "L3MON4D3/LuaSnip", version = "v2.*" },
  "rafamadriz/friendly-snippets",
  { "saghen/blink.cmp", version = "1.*" },

  -- LSP
  "neovim/nvim-lspconfig",
  { "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    config = function()
      return require("symbol-usage").setup()
    end
  },
  { "sontungexpt/better-diagnostic-virtual-text",
    event = "LspAttach",
    config = function()
      return require("better-diagnostic-virtual-text").setup()
    end
  },
  { "folke/trouble.nvim",
    event = "LspAttach",
    config = function()
      return require("trouble").setup()
    end
  },
  { "romus204/tree-sitter-manager.nvim",
    config = function()
      return require("tree-sitter-manager").setup({
        ensure_installed = {
          "c", "cpp", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc"
        },
        auto_install = true
      })
    end
  },

  -- Visuals
  -- "lukas-reineke/indent-blankline.nvim",
  { "shellRaining/hlchunk.nvim",
    config = function()
      return require("hlchunk").setup({
        line_num = { enable = true },
        chunk = { enable = true },
        indent = { enable = true }
      })
    end
  },
  { "lewis6991/gitsigns.nvim",
    config = function()
      return require("gitsigns").setup()
    end
  },
  { "rachartier/tiny-glimmer.nvim",
    config = function()
      return require("tiny-glimmer").setup()
    end
  },
  { "nvim-lualine/lualine.nvim",
    config = function()
      return require("lualine").setup()
    end
  },
  { "j-hui/fidget.nvim",
    config = function()
      return require("fidget").setup()
    end
  },

  -- DAP
  "mfussenegger/nvim-dap",
  { "igorlfs/nvim-dap-view", version = "1.*" },
})

require("core.options")
require("core.keymaps")
require("configs.blink_cmp")
require("configs.lspconfig")
require("configs.dapconfig")

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})


vim.cmd.colorscheme("catppuccin-mocha")
