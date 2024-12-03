return {
  -- file browser
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        position = "left",
      },
      -- event_handlers = {
      --{
      -- event = "file_open_requested",
      --handler = function()
      -- require("neo-tree.command").execute({ action = "close" })
      --end,
      --},
      --},
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false, -- デフォルトで隠されているかどうか
          show_hidden_count = true,
          hide_dotfiles = false, -- dotfileを隠すかどうか
          hide_gitignored = false, -- gitignoreされているファイルを隠すかどうか
          hide_by_name = {
            "node_modules",
            "thumbs.db",
          },
          never_show = {
            ".git",
            ".DS_Store",
            ".history",
          },
        },
      },
    },
    cmd = "Neotree",
  },
  {
    "williamboman/mason.nvim",
    require("mason").setup(),
  },
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- pin to github releases
    dependencies = {
      "nvim-lua/plenary.nvim", -- for standard functions
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim", -- for picking b/w different remote methods
    },
    config = true,
  },
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
  },
}
