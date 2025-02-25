-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.scrolloff = 10

-- options for quickscope to only enable on keypress
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
