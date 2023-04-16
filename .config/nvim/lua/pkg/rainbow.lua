local ok, cfg = pcall(require, 'nvim-treesitter.configs')

if not ok then
  vim.notify("Error starting treesitter", vim.log.levels.ERROR)
  return
end
cfg.setup{}
