return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ensure_installed = {
        "bash",
        "c_sharp",
        "css",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "prisma",
        "typescript",
        "tsx",
        "yaml",
        "vim",
        "vimdoc",
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = {
              query = "@function.outer",
              desc = "function",
            },
            ["if"] = {
              query = "@function.inner",
              desc = "inner function",
            },
            ["ab"] = {
              query = "@block.outer",
              desc = "block",
            },
            ["ib"] = {
              query = "@block.inner",
              desc = "inner block",
            },
            ["ac"] = {
              query = "@class.outer",
              desc = "class",
            },
            ["ic"] = {
              query = "@class.inner",
              desc = "inner class",
            },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[c"] = { query = "@class.outer", desc = "Previous class start" },
            ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[C"] = { query = "@class.outer", desc = "Previous class end" },
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Make movement repeatable
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
