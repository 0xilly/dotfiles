-- add this before anything else laods
--

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

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
