local g = vim.g
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.editorconfig = true

require('utils')
require('settings')
require('packer_boot')
require('pkgs')

--map('n', '<leader>')
--m


map("n", "<leader>om",":lua print('foo')<CR> ") -- not working
--require('keymaps')

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044



--vim.cmd.colorscheme 'melange'
