local g = vim.g
vim.g.mapleader = " "
vim.g.editorconfig = true

require('utils')
require('settings')
require('packer_boot')
require('pkgs')
require('keymaps')

--vim.cmd.colorscheme 'melange'
