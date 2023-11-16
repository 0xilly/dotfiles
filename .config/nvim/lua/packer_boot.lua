local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  }

  use {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
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

  use "folke/which-key.nvim"
  use({ 'rose-pine/neovim', as = 'rose-pine' })


  use "savq/melange-nvim"
  use {
    'f-person/auto-dark-mode.nvim',
    'ray-x/go.nvim',
    'ray-x/guihua.lua', -- recommended if need floating window support
  }

  use 'p00f/clangd_extensions.nvim'
  use 'Mofiqul/vscode.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'HiPhish/nvim-ts-rainbow2'
  use 'numToStr/FTerm.nvim'
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  use "IndianBoy42/tree-sitter-just"

  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

  use {
    'akinsho/flutter-tools.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },

    use 'github/copilot.vim'
}


  if packer_bootstrap then
    require('packer').sync()
  end
end)
