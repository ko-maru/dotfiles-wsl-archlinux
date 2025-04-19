return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "neovim/nvim-lspconfig",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "zbirenbaum/copilot.lua",
      "zbirenbaum/copilot-cmp",
      "windwp/nvim-autopairs",
      "nvim-orgmode/orgmode",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("copilot_cmp").setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<cr>"] = cmp.mapping(function(fallback)
            fallback()
          end),
          ["<c-y>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({ select = true })
              end
            else
              fallback()
            end
          end),
          ["<c-e>"] = cmp.mapping.abort(),
          ["<c-b>"] = cmp.mapping.scroll_docs(-4),
          ["<c-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
          ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<tab>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<s-tab>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "orgmode" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "copilot" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = { Copilot = "" },
          }),
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",
    buile = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
