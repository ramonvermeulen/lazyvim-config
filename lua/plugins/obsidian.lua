return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "second-brain",
        path = "~/second-brain/",
      },
    },
  },
}
