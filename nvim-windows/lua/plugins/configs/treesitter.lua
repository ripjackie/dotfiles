require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "python", "go", "rust",
    "vim", "vimdoc", "query", "bash",
    "html", "css", "json", "toml", "ini", "xml", "yaml"
  },
  highlight = { enable = true }
})
