return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- pyright has some problems with monorepos that have multiple venvs
        -- this config resolves that issue so that root_dir is correctly set
        pyright = {
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(tonumber(bufnr))
            local start = vim.fs.dirname(fname)

            local root = vim.fs.find({
              "pyrightconfig.json",
              "pyproject.toml",
              "uv.lock",
              ".venv",
            }, {
              path = start,
              upward = true,
              type = "file",
            })[1]

            root = root
              or vim.fs.find(".venv", {
                path = start,
                upward = true,
                type = "directory",
              })[1]

            root = root
              or vim.fs.find(".git", {
                path = start,
                upward = true,
                type = "directory",
              })[1]

            root = root and vim.fs.dirname(root) or start

            on_dir(root)
          end,
        },
      },
    },
  },
}
