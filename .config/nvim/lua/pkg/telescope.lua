local ok, cfg = pcall(require, 'telescope')

if not ok then
  vim.notify("Error starting telescope", vim.log.levels.ERROR)
  return
end

cfg.setup {}
