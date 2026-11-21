return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "<leader>ff", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in filetree" },
    { "<C-n>",      "<cmd>NvimTreeToggle<cr>",   desc = "Find file in filetree" },
  },
  opts = {
    filters = {
      dotfiles = false,
      git_ignored = false,
      git_clean = false,
    },
    git = {
      enable = true,
      ignore = false,
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
    view = {
      adaptive_size = true,
      float = {
        enable = true,
        quit_on_focus_loss = false,
      },
    },
  },
}
