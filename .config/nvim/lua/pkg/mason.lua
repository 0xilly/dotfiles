local ok, cfg = pcall(require, 'mason')

if not ok then
  vim.notify("Error starting mason", vim.log.levels.ERROR)
  return
end

cfg.setup{}
