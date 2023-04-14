-- add this before anything else laods
local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
--set.softtabstop = 2

set.hlsearch = true
set.incsearch = true
set.smartcase = true
set.number= true
set.splitbelow = true
set.splitright = true
set.termguicolors = true

set.timeoutlen = 50
set.showtabline = 0

vim.cmd("source ~/.config/nvim/lua/settings/settings.vim")
