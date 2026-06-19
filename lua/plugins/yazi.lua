return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- Open Yazi at the current file's location
      { "<leader>e", "<cmd>Yazi<cr>", desc = "Explorer (Yazi)" },
      -- Open Yazi at Neovim's working directory
      { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Explorer (Yazi) at CWD" },
      -- Resume the last Yazi session
      { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume Yazi" },
    },
    opts = {
      open_for_directories = true,
    },
  },
}
