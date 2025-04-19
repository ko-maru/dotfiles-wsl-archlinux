-- Reload settings
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.split(vim.fn.expand("~/dotfiles/.config/nvim/**/*.lua"), "\n"),
  group = vim.api.nvim_create_augroup("init.lua", { clear = true }),
  callback = function()
    vim.cmd.source("~/dotfiles/.config/nvim/init.lua")
  end,
})
