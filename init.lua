-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("luasnip/loaders/from_vscode").load({
  paths = {
    "~/.config/nvim/geo-snippets",
  },
})

require("luasnip").filetype_extend("python", { "django" })
