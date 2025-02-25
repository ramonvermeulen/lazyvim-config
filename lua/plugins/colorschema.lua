return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
        colors = {},
        background = {},
        overrides = function(colors)
          return {}
        end,
      })

      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local colors = {
        dragonBlack = "#0D0C0C",
        dragonGray = "#A6A69C",
        dragonLightGray = "#C5C9C5",
        dragonBackground = "#282727",
        dragonForeground = "#C8C093",
        dragonRed = "#C4746E",
        dragonGreen = "#87A987",
        dragonYellow = "#C4B28A",
        dragonBlue = "#8BA4B0",
        dragonOrange = "#B6927B",
        inactiveGray = "#625e5a",
      }

      local shared_sections = {
        b = { bg = colors.dragonBackground, fg = colors.dragonLightGray },
        c = { bg = colors.dragonBackground, fg = colors.dragonLightGray },
      }

      local theme = {
        normal = vim.tbl_extend("force", {
          a = { bg = colors.dragonGray, fg = colors.dragonBlack, gui = "bold" },
        }, shared_sections),

        insert = vim.tbl_extend("force", {
          a = { bg = colors.dragonRed, fg = colors.dragonBlack, gui = "bold" },
        }, shared_sections),

        visual = vim.tbl_extend("force", {
          a = { bg = colors.dragonOrange, fg = colors.dragonBlack, gui = "bold" },
        }, shared_sections),

        replace = vim.tbl_extend("force", {
          a = { bg = colors.dragonBlue, fg = colors.dragonBlack, gui = "bold" },
        }, shared_sections),

        command = vim.tbl_extend("force", {
          a = { bg = colors.dragonGreen, fg = colors.dragonBlack, gui = "bold" },
        }, shared_sections),

        inactive = {
          a = { bg = colors.inactiveGray, fg = colors.dragonGray, gui = "bold" },
          b = { bg = colors.inactiveGray, fg = colors.dragonGray },
          c = { bg = colors.inactiveGray, fg = colors.dragonGray },
        },
      }

      require("lualine").setup({
        options = { theme = theme },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}
