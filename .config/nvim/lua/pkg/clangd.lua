local ok, cfg = pcall(require, 'clangd_extensions')


if not ok then
  vim.notify("Error starting clangd", vim.log.levels.ERROR)
  return
end

cfg.setup{}
