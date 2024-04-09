require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c", "lua", "python",
    "vim", "vimdoc", "query", "luadoc"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  endwise = {
    enable = true
  }
}