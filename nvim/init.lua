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
      return require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({'[c', bang = true})
            else
              gitsigns.nav_hunk('prev')
            end
          end)
              -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk)
          map('n', '<leader>hr', gitsigns.reset_hunk)

          map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end)

          map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end)

          map('n', '<leader>hS', gitsigns.stage_buffer)
          map('n', '<leader>hR', gitsigns.reset_buffer)
          map('n', '<leader>hp', gitsigns.preview_hunk)
          map('n', '<leader>hi', gitsigns.preview_hunk_inline)

          map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
          end)

          map('n', '<leader>hd', gitsigns.diffthis)

          map('n', '<leader>hD', function()
            gitsigns.diffthis('~')
          end)

          map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
          map('n', '<leader>hq', gitsigns.setqflist)

          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
          map('n', '<leader>tw', gitsigns.toggle_word_diff)

          -- Text object
          map({'o', 'x'}, 'ih', gitsigns.select_hunk)
        end
      })
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
