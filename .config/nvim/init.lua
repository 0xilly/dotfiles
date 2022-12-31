local g = vim.g
vim.g.mapleader = " "

require('utils')
require('settings')
require('packages')
require('keymaps')
vim.cmd("colorscheme nightfox")
