return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  dependencies = {
    "neovim/nvim-lspconfig",
    -- "junnplus/lsp-setup.nvim",

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    -- "hrsh7th/cmp-nvim-lsp-signature-help",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    "folke/lazydev.nvim",
    "onsails/lspkind.nvim"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format()
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        -- { name = "nvim_lsp_signature_help" },
        { name = "lazydev" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping(function(fb)
          if cmp.visible() and cmp.get_active_entry() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm()
            end
          else
            fb()
          end
        end),
        ["<Tab>"] = cmp.mapping(function(fb)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fb()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fb)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fb()
          end
        end, { "i", "s" }),
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
