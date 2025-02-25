return {
  {
    "folke/flash.nvim",
    enabled = false, -- default lazyvim plugin that conflicts with quick-scope
  },
  {
    "unblevable/quick-scope",
    config = function()
      vim.cmd([[
        highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
      ]])
    end,
  },
}
