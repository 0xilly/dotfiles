local ok, cfg = pcall(require, 'go')

if not ok then
  vim.notify("Error starting go", vim.log.levels.ERROR)
  return
end

cfg.setup {}
