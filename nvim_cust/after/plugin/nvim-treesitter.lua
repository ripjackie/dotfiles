require("nvim-treesitter.configs").setup({
  ensure_installed = { "vim", "vimdoc", "markdown", "markdown_inline", "python", "lua" },
  highlight = { enable = true },
  indent = { enable = true },
  endwise = { enable = true }
})
