-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

local function smart_rename()
  -- Get the current client attached to the buffer
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local lsp_can_rename = false

  -- Check if any attached LSP server supports document/rename
  for _, client in ipairs(clients) do
    if client.supports_method("textDocument/rename") then
      lsp_can_rename = true
      break
    end
  end

  if lsp_can_rename then
    -- Use Neovim's native LSP rename (project-wide)
    vim.lsp.buf.rename()
  else
    -- Fallback: Use built-in :substitute for current buffer
    local current_word = vim.fn.expand("<cword>")
    local msg = string.format("LSP Rename not supported. Enter new name for '%s': ", current_word)

    vim.ui.input({ prompt = msg, default = current_word }, function(new_name)
      if new_name and new_name ~= "" then
        -- Execute project-wide substitution safely
        vim.cmd(string.format("%%s/\\<%s\\>/%s/gI", current_word, new_name))
        print(string.format("Replaced all instances of '%s' with '%s'", current_word, new_name))
      end
    end)
  end
end

-- normal mode
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Telescope document symbols" })
keymap.set("n", "<leader>cs", "<cmd>Telescope colorscheme<cr>", { desc = "Telescope color schema" })
keymap.set("n", "<C-u>", "<C-u>zz") -- center after moving up/down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-f>", "<C-f>zz")
keymap.set("n", "<C-l>", "<C-l>zz")
keymap.set("n", "<leader>cr", smart_rename, { desc = "Rename symbol" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find through file content via ripgrep" })
