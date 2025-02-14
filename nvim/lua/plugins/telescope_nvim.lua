return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  lazy = false,
  version = "0.1.x",
  config = function()
    local ts = require("telescope")
    ts.setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        }
      }
    })
    ts.load_extension('fzf')
    ts.load_extension("file_browser")
  end
}
