local cmp = require("cmp")

local setup = {}

setup.snippet = {
  expand = function(args)
    require("luasnip").lsp_expand(args.body)
  end
}

setup.window = {}

setup.mapping = cmp.mapping.preset.insert({
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<CR>"] = cmp.mapping.confirm({ select = true })
})

setup.sources = cmp.config.sources({
  { name = "nvim_lsp" },
  { name = "luasnip" }
}, {
  { name = "buffer" },
  { name = "path" }
})

cmp.setup(setup)

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})
