return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "templete_string" },
        javascriptreact = { "templete_string" },
        typescript = { "template_string" },
        typescriptreact = { "template_string" },
      },
    })
  end,
}
