-- File format
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin"
vim.o.fileformats = "unix,dos,mac"

-- Edit
vim.o.swapfile = false
vim.o.undofile = true

-- View
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.showmatch = true
vim.o.showmode = false
vim.o.list = true
vim.o.listchars = "tab:>-,nbsp:+"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.signcolumn = "yes"
vim.o.laststatus = 3

-- Command
vim.o.wildmode = "list:longest,full"
vim.o.history = 1000

-- Tab
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 0

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable unnecessary default plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
