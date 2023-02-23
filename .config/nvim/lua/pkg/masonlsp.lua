local ok, cfg = pcall(require, 'mason-lspconfg')

if not ok then
  vim.notify("Error starting mason lspconfg", vim.log.levels.ERROR)
  return
end

cfg.setup{}

