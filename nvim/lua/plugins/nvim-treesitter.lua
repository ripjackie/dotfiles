return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local vim = vim
    local treesitter = require("nvim-treesitter")
    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site"
    })
    treesitter.install({
      "bash",
      "c",
      "c_sharp",
      "comment",
      "cpp",
      "java",
      "javascript",
      "lua",
      "luadoc",
      "luap",
      "meson",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "typescript",
      "vim",
      "vimdoc",
    })

    local treesitter_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/"

    local parsers = {}
    for name, type in vim.fs.dir(treesitter_dir .. "runtime/queries") do
      if type == "directory" then
        table.insert(parsers, name)
      end
    end

    local file_types = vim.iter(parsers)
        :map(function(parser)
          return vim.treesitter.language.get_filetypes(parser)
        end):flatten():totable()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = file_types,
      callback = function(args)
        -- treesitter highlighting
        vim.treesitter.start()

        -- treesitter folding

        -- treesitter indenting
        vim.bo[args.buf].indentexpr = "v:lua.require\"nvim-treesitter\".indentexpr()"
      end
    })
  end
}
