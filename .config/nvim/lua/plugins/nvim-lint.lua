return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>ll",
      function()
        require("lint").try_lint()
      end,
    },
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      rust = { "clippy" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
