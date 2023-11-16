local ok, cfg = pcall(require, 'auto-dark-mode')

if not ok then
  vim.notify("Error starting auto-dark", vim.log.levels.ERROR)
  return
end

cfg.setup {
  update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option('background', 'dark')
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'vscode'
     -- vim.cmd('colorscheme gruvbox')
    end,
    set_light_mode = function()
      vim.api.nvim_set_option('background', 'light')
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'vscode'
      --vim.cmd('colorscheme gruvbox')
    end,
}

cfg.init()
