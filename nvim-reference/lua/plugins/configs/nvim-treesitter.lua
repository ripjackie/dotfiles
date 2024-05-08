require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "python", "json", "yaml", "toml",
    "vim", "vimdoc", "query", "luadoc"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})
