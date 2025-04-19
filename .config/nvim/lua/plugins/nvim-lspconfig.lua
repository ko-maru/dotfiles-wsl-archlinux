return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local function handle(server_name, opts)
        vim.lsp.enable(server_name)
        vim.lsp.config(
          server_name,
          vim.tbl_deep_extend("error", opts or {}, {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          })
        )
      end

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          handle(server_name)
        end,
        ["lua_ls"] = function()
          handle("lua_ls", {
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                  pathStrict = true,
                  path = { "?.lua", "?/init.lua" },
                },
                workspace = {
                  library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
                    "${3rd}/luv/library",
                  }),
                  checkThirdParty = "Disable",
                },
                diagnostics = {
                  disable = { "lowercase-global" },
                  globals = { "vim" },
                },
                format = {
                  enable = false,
                },
              },
            },
          })
        end,
        ["rust_analyzer"] = function()
          handle("rust_analyzer", {
            settings = {
              ["rust-analyzer"] = {
                -- nvim-lint側でlintを行うので無効化
                checkOnSave = false,
              },
            },
          })
        end,
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
    keys = {
      { "<leader>lr", "<cmd>Lspsaga rename ++project<cr>", desc = "Rename" },
      { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      { "<leader>ld", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "<leader>lt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek type definition" },
      { "<leader>li", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming calls" },
      { "<leader>lo", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing calls" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostics" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev diagnostics" },
    },
    opts = function()
      require("lspsaga").setup({})
    end,
  },
}
