require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/vscode.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
    end
  }

  use 'mfussenegger/nvim-jdtls'

  use 'mfussenegger/nvim-dap'

  use {
    "rcarriga/nvim-dap-ui",
      requires = {"mfussenegger/nvim-dap",}
  }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'Tetralux/odin.vim'

  use 'numToStr/Fterm.nvim'

--  use {
--    'nanozuki/tabby.nvim',
--    commit = '7b101a88a5246fb6932cf7b97b0da0024200f596',
--  }
--
--  use {
--    'romgrk/barbar.nvim',
--    requires = {'kyazdani42/nvim-web-devicons'}
--  }

  use "folke/which-key.nvim"

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  use 'fatih/vim-go'
  use "EdenEast/nightfox.nvim"
  use "p00f/nvim-ts-rainbow"
  use 'tikhomirov/vim-glsl'

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  use "ahmedkhalf/project.nvim"

  use {
    'scalameta/nvim-metals',
    requires = "nvim-lua/plenary.nvim",
  }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'klen/nvim-config-local'

end)


require("packages.whichkey")
require("packages.lualine")
require("packages.treesitter")
require("packages.lspinstaller")
require("packages.lspconfig")
require("packages.nvimtree")
require("packages.cmp")
--require("packages.tabby")
require("packages.todo")
require("packages.project")
require("packages.telescope")
--require("packages.javalsp")
--require("packages.barbar")
require('packages.metals')
require('packages.dap')
require('packages.daptext')
require('packages.dapui')
require('packages.localconfig')
