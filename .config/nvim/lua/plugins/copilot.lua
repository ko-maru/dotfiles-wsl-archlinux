return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    keys = {
      { "<leader>at", "" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    opts = {},
    keys = {
      { "<leader>ac", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot chat window" },
    },
  },
}
