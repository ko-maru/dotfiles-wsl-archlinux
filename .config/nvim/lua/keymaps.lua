vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "H", "<cmd>bprev<cr>", { silent = true, desc = "Move to previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<cr>", { silent = true, desc = "Move to next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { silent = true, desc = "Move to bottom window" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { silent = true, desc = "Move to top window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { silent = true, desc = "Move to right window" })
vim.keymap.set("v", "<", "<gv", { desc = "Repeatable indentation" })
vim.keymap.set("v", ">", ">gv", { desc = "Repeatable outdentation" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete text without registering" })
vim.keymap.set(
  "n",
  "<esc><esc>",
  "<cmd>nohlsearch|diffupdate|normal! <c-l><cr>",
  { silent = true, desc = "Remove hightlight" }
)
vim.keymap.set("n", "+", "<c-a>", { desc = "Increment" })
vim.keymap.set("n", "-", "<c-x>", { desc = "Decrement" })
