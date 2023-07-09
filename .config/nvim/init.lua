local g = vim.g
vim.g.mapleader = " "
vim.g.editorconfig = true

require('utils')
require('settings')
require('packer_boot')
require('pkgs')
require('keymaps')

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})


--vim.cmd.colorscheme 'melange'
