require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "luadoc", "luap", "python", "vim", "vimdoc", "query",
    "bash", "cmake", "markdown", "markdown_inline", "make", "sql",
    "html", "css", "xml", "json", "yaml", "toml", "ini"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = { enable = false }
})
