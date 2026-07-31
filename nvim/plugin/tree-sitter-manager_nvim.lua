vim.pack.add({
  {
    src = "https://github.com/romus204/tree-sitter-manager.nvim"
  }
})

require("tree-sitter-manager").setup({
  auto_install = true,
  ensure_installed = {
  "lua", "rust", "c_sharp", "python", "c", "cpp", "go", "html", "css", "powershell",
  "csv", "json", "toml", "ini", "diff", "json5", "latex", "luadoc", "luap",
  "markdown", "markdown_inline", "meson", "xml",
  "desktop", "awk", "bash", "cmake", "comment", "make", "zsh",
  "git_config", "git_rebase", "gitcommit", "gitignore",
  "http",
  }
})
