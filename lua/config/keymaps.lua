-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- normal mode
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Telescope document symbols" })
keymap.set("n", "<leader>cs", "<cmd>Telescope colorscheme<cr>", { desc = "Telescope color schema" })
keymap.set("n", "<C-u>", "<C-u>zz") -- center after moving up/down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-f>", "<C-f>zz")
keymap.set("n", "<C-l>", "<C-l>zz")

keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find through file content via ripgrep" })
