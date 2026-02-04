-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.scrolloff = 10
opt.relativenumber = false

-- show ~ as EndOfBuffer character
opt.fillchars = { eob = "~" }
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#a0a0a0" })
  end,
})

-- Highlight the 80th
opt.colorcolumn = "81"
vim.cmd([[highlight ColorColumn ctermbg=lightgrey guibg=lightgrey]])

-- options for quickscope to only enable on keypress
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
