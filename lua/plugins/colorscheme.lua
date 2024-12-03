return {
  { "xiyaowong/transparent.nvim" },
  { "neanias/everforest-nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  require("tokyonight").setup({
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  }),
}
